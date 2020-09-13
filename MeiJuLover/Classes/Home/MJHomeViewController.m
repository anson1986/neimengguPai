//
//  MJHomeViewController.m
//  MeiJuLover
//
//  Created by Mac on 2020/9/7.
//  Copyright © 2020 sport. All rights reserved.
//

#import "MJHomeViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CWCarousel.h"
#import "CWPageControl.h"
#import "MJHomeTableViewCell.h"
//#import "LRScanViewController.h"
#import "PermissionUtils.h"
#import "MJDetailViewController.h"
#import "SVProgressHUD.h"
#define kViewTag 666
#define kCount 0

@interface MJHomeViewController ()<CWCarouselDatasource, CWCarouselDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) CWCarousel *carousel;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) AVCaptureDevice * device;
@property (nonatomic, strong) AVCaptureDeviceInput * input;
@property (nonatomic, strong) AVCaptureMetadataOutput * output;
@property (nonatomic, assign) BOOL isOn;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray *contentArray;


@end

@implementation MJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"拍拍大草原";
    [self setupSubViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)torchView {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 60, 21);
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [leftBtn setTitle:@"开灯" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn = leftBtn;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    self.input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 60, 21);
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [rightBtn setTitle:@"扫一扫" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightBtn;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}

- (void)setupSubViews {
    CWFlowLayout *flowLayout = [[CWFlowLayout alloc] initWithStyle:CWCarouselStyle_H_2];
    CWCarousel *carousel = [[CWCarousel alloc] initWithFrame:CGRectZero
                                                    delegate:self
                                                  datasource:self
                                                  flowLayout:flowLayout];
    carousel.isAuto = YES;
    carousel.autoTimInterval = 5;
    carousel.endless = YES;
    carousel.aligment = UICollectionViewScrollPositionLeft;
    carousel.backgroundColor = MainColor;
    [carousel registerViewClass:[UICollectionViewCell class] identifier:@"cellId"];
    [self.view addSubview:carousel];
    
    [carousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_offset(230);
    }];
    
    self.carousel = carousel;
    [self.carousel freshCarousel];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = MainColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.top.equalTo(self.carousel.mas_bottom).offset(0);
    }];
    
    [self torchView];
}

#pragma mark - CWCarouselDatasource && CWCarouselDelegate
- (NSInteger)numbersForCarousel {
    return self.dataArr.count;
}

- (UICollectionViewCell *)viewForCarousel:(CWCarousel *)carousel indexPath:(NSIndexPath *)indexPath index:(NSInteger)index{
    UICollectionViewCell *cell = [carousel.carouselView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    UIImageView *imgView = [cell.contentView viewWithTag:kViewTag];
    if(!imgView) {
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, cell.bounds.size.width - 20, cell.bounds.size.height)];
        imgView.tag = kViewTag;
        imgView.backgroundColor = [UIColor redColor];
        [cell.contentView addSubview:imgView];
        cell.layer.masksToBounds = YES;
        imgView.contentMode = UIViewContentModeScaleAspectFill;
    }

    NSString *name = self.dataArr[index];
    UIImage *img = [UIImage imageNamed:name];
    if(!img) {
        NSLog(@"%@", name);
    }
    [imgView setImage:img];
    return cell;
}

- (void)CWCarousel:(CWCarousel *)carousel didSelectedAtIndex:(NSInteger)index {
    NSLog(@"...%ld...", (long)index);
}


- (void)CWCarousel:(CWCarousel *)carousel didStartScrollAtIndex:(NSInteger)index indexPathRow:(NSInteger)indexPathRow {
    NSLog(@"开始滑动: %ld", index);
}


- (void)CWCarousel:(CWCarousel *)carousel didEndScrollAtIndex:(NSInteger)index indexPathRow:(NSInteger)indexPathRow {
    NSLog(@"结束滑动: %ld", index);
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MJHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    if (!cell) {
        cell = [[MJHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mainCell"];
    }
    
    cell.imgName = self.dataArr[indexPath.row];
    cell.title = self.titleArr[indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MJDetailViewController *vc = [[MJDetailViewController alloc] init];
    vc.title = self.titleArr[indexPath.row];
    vc.picName = self.dataArr[indexPath.row];
    vc.content = self.contentArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getter
- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
        NSString *imgName = @"";
        for (int i = 0; i < 5; i++) {
            imgName = [NSString stringWithFormat:@"0%ld.jpg", i + 1];
            [_dataArr addObject:imgName];
        }
    }
    return _dataArr;
}

- (NSMutableArray *)titleArr {
    if (!_titleArr) {
        _titleArr = @[@"响沙湾",@"呼伦贝尔大草原",@"成吉思汗陵",@"阿尔山",@"阿斯哈图石阵"].mutableCopy;
    }
    return _titleArr;
}

- (void)rightButtonAction:(UIButton *)sender {
    [SVProgressHUD showSuccessWithStatus:@"开发中，敬请期待！"];
//    if ([PermissionUtils isAppHasCameraPermission]) {
//        LRScanViewController *vc = [[LRScanViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
}

- (NSMutableArray *)contentArray {
    if (!_contentArray) {
        _contentArray = @[@"响沙湾旅游景区响沙湾地处陕西、山西、内蒙古金三角地带，景区面积为24平方公里，居呼和浩特市、包头市、鄂尔多斯市“金三角”开发区中心，被称作“黄河金腰带上的金纽扣”。响沙湾于1984年1月被开辟为旅游景点，2002年被国家旅游局评定为国家4A级旅游景区，2011年1月被评为国家5A级旅游景区。是一处自然生态、休闲度假景区。经过多年的探索和开拓，景区现基本上形成一村（一粒沙度假村）、一港（响沙湾港）、四岛（仙沙岛、悦沙岛、莲沙岛、福沙岛）的格局。响沙湾港是进入沙漠的必经之地，也是游客的集散地，从这里可以乘坐冲浪车进入仙沙岛、乘坐沙漠观光小火车进入悦沙岛。仙沙岛是响沙湾游览项目最集中的地方，有沙漠探险与高空滑索，冲浪与秋千，轨道自行车，各种精彩刺激的体验活动，适合各个年龄层次的游客。在这里还可以欣赏到惊险奇特的表演项目，高空走钢丝，环球飞车，刀山，吃火，喷火，还有果老剧场的大型演出《沙漠杂技大世界》在欢迎您。乘着沙漠深处的火车可到悦沙岛休闲世界。在这能看到长长的驼铃商队，路过古老的蒙古部落，进入悦沙岛，在这里体验艺术与体育带来的愉悦，艺术体操、健美操、街舞、沙滩排球等。",@"内蒙古呼伦贝尔草原是个风光优美、景色宜人的地方,那里有一望无际的绿色,有延绵起伏的大兴安岭,还有美丽富饶的呼伦湖和贝尔湖。这里被人们盛赞为北国碧玉，人间天堂。春天，冰雪融化了。小草飘动着细细的嫩芽，花儿在风中散发着无限的幽香，草原的野草野花开始盛开了，五颜六色的，就像一块漂亮的地毯，披在呼伦贝尔的大地上。树木也穿上了绿色的纱衣，春燕欢笑着归来，整个大草原春意盎然。春天的呼伦贝尔变得万紫千红，美不胜收。夏天这里空气清新,气温凉爽，是避暑度假的胜地。一场细雨过后,一览草原风光.美丽的大草原一眼望不到边,蓝天白云、碧草绿浪、湖水涟漪、牛羊成群、点点毡房、袅袅炊烟,整个草原清新宁静。茫茫无际的牧场,传来悠扬的牧歌，一条弯弯的小河，静静地流向远方。白色的羊群在山坡上吃草.远远望去,好像是白云飘浮在山间,又好似粒粒珍珠撒落在草原上.微风吹过，草浪滚滚，形成了一片绿色的海洋。牧羊的姑娘，唱着动听的情歌，挥动着羊鞭，游走在美丽的草原上。傍晚，夕阳西下的时候，在霞光的辉映下，草原与天连成一片。蒙古包里响起了委婉动听的马头琴声，这动与静相结合的草原美景，怎不叫人心旷神怡。秋天，这里是一片金黄的世界。",@"成吉思汗陵占地约5.5公顷，但颇有特色，是我国内蒙古的一处主要旅游景点。成吉思汗陵坐落在内蒙伊克召盟伊金霍洛旗甘德利草原上，距东胜市70公里。成吉思汗是蒙古杰出的军事家、政治家，他在统一蒙古诸部后于1206年被推为大汗，建立了蒙古汗国。他即位后展开了大规模的军事活动，版图扩展到中亚地区和南俄。1226年率兵南下攻西夏，次年在西夏病死。元朝建立后，成吉思汗被追尊为元太祖。成吉思汗是位伟奇性的历史人物，因而他的陵寝对旅游者也有很强的吸引力。蒙古包式的宫殿成吉思汗陵的主体是由三个蒙古包式的宫殿一字排开构成。三个殿之间有走廊连接，在三个蒙古包式宫殿的圆顶上。金黄色的琉璃瓦在灿烂的阳光照射下，熠熠闪光。圆顶上部有用蓝色琉璃瓦砌成的云头花，即是蒙古民族所崇尚的颜色和图案。正殿高26米，双层屋檐；东西殿高23米，单层屋檐；后殿和走廊高20米；从高处下望，整个大殿像一只雄鹰，正殿像鹰的头和身子，两个侧殿则似在雄鹰展开的双翼。正殿正中摆放成吉思汗的雕像，高5米，身着盔甲战袍，腰佩宝剑，相貌英武，端坐在大殿中央。后殿为寝宫，安放四个黄缎罩着的灵包，包内分别供奉成吉思汗和他的三位夫人的灵枢，灵包的前面摆着一……",@"阿尔山—柴河景区位于内蒙古东部经济较发达地区的核心位置，与周边城市之间交通便捷，具有整合满洲里、海拉尔、扎兰屯、乌兰浩特、锡林浩特等地旅游资源，构建内蒙古旅游黄金区域的战略地位。同时，阿尔山市位于东北亚经济圈腹地和我国东北经济区西出口，西邻蒙古国，边境线长93.531公里，按照联合国开发计划署的论证和规划，修通阿尔山至蒙古国乔巴山的铁路，可以形成东起图们，西连蒙古、俄罗斯，沟通整个东北亚的新欧亚大陆桥，阿尔山则成为这座欧亚大陆桥的“桥头堡”，其经济地理位置十分重要。(一)矿泉资源。阿尔山矿泉是世界最大的功能型矿泉之一。经中科院、中国地质大学联合进行的火山科考认定，阿尔山周围就有冷泉、温泉、热泉、高热泉等温度不同、功能各异的饮用和洗浴矿泉逾百眼。其中，国家AAAA级景区——阿尔山温泉疗养院内，在宽70米，长500米的芳草地上就出露有能够治疗心脑血管疾病、皮肤病、关节炎等八大系统疾病的矿泉48眼，其它矿泉集中分布在金江沟、银江沟一带。 ",@"阿斯哈图花岗岩石林景区位于克什克腾旗东北部，在距离大兴安岭最高峰黄岗峰约40公里的北大山上，国家AAAA级景区“阿斯哈图”是蒙古语，意思是“险竣的岩石”。景区南北长5.5公里，东西宽3公里，占地面积约为15平方公里，平均海拔为1700米左右。阿斯哈图石林景区快速、健康发展的同时，由于各方面工作业绩突出，先后获得了--中国优秀旅游目的地、国家生态旅游服务标准化试点单位等多项殊荣。并成功打造了“山水草原，北方石林”这一旅游品牌，成为内蒙古地区的著名景区。阿斯哈图花岗岩石林同云南石林相比，虽然都叫“石林”，可形成的原因却不同，石林的形状也不同。云南石林石头的纹理是垂直上下的，似刀劈斧砍；而阿斯哈图石林石头的纹理是横向的，一层一层，像千层饼。阿斯哈图石林也叫做冰石林，是世界上罕见的、形态和成因在全球都具有代表性，并且是目前世界上独有的一种奇特地貌景观。举目眺望，阿斯哈图石林之间，那茂密的原始白桦林枝繁叶茂，偶有獐狍野鹿悠闲自得地穿行其中，草地上杂花缤纷，蝶舞蜂飞。给峥嵘挺拔的石林，平添了几多温情，几多风韵。远处那平坦开阔的草原上，星星点点的毡房和成群的牛羊，仿佛是在绿海中浮动。"].mutableCopy;
    }
    return _contentArray;
}

- (void)leftButtonAction:(UIButton *)sender {
    
    if (self.isOn) {
        [_device lockForConfiguration:nil];
        [_device setTorchMode:AVCaptureTorchModeOff];
        [_device unlockForConfiguration];
        [self.leftBtn setTitle:@"开灯" forState:UIControlStateNormal];
    }else {
        [_device lockForConfiguration:nil];
        [_device setTorchMode:AVCaptureTorchModeOn];
        [_device unlockForConfiguration];
        [self.leftBtn setTitle:@"关灯" forState:UIControlStateNormal];
    }
    
    self.isOn = !self.isOn;
}

@end
