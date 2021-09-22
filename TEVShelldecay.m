%% Plot entire TEV timelpase data

% Raw data from three trials
data1 = [1	1.013340148	0.981315661	0.854539952	0.756672412	0.684501952	0.629871014	0.588108332	0.547328806	0.505216302	0.465834017	0.439644552	0.413872872	0.39056504	0.376717201	0.360466414	0.346481693	0.336226188	0.322761462	0.30817529	0.297420029	0.279555392	0.26994822	0.26033829	0.251746484	0.246886437	0.243180751	0.232135378	0.218547503	0.216210016	0.201917332	0.193699307	0.184926143	0.1827208	0.177384948	0.163978431	0.161625527	0.153163248	0.148310763	0.1419484	0.131977209	0.127573836	0.123539218	0.120054844	0.107105861	0.106497059	0.103067954	0.101546808	0.096919762	0.091895234	0.082242639	0.08322915	0.078402345	0.076352053	0.078709286	0.071508549	0.067416831	0.064133366	0.058759063	0.057303101	0.054111471	0.052598715	0.048101897	0.048357195	0.047691916	0.04405628	0.045281422	0.041190236	0.0386553	0.035597228	0.034662116	0.034533293	0.032792965	0.030997108	0.031140603	0.029517622	0.026278842	0.025828325	0.024918919	0.022073752	0.022747428	0.020297913	0.020326498	0.019013999	0.018822996	0.019663042	0.018245808	0.018142535	0.016017734	0.013928455	0.015289897	0.014836804	0.01426039	0.014350864	0.012856886	0.013941952	0.012502811	0.012850731	0.011429728	0.011191538	0.010056791	0.009920009	0.010291767	0.012508883	0.01120257	0.011284498	0.009718404	0.010565836	0.01018346	0.008826804	0.009134781	0.008489559	0.008489559	0.008489559	0.008489559	0.008489559	0.008489559	0.008489559	0.008489559	0.008489559	0.008489559];

data2 = [1	0.952767868	0.912392513	0.902472405	0.823106339	0.757940107	0.704725757	0.676951708	0.59175469	0.546817252	0.517144255	0.509666288	0.494803412	0.480881873	0.462347464	0.43958625	0.428361022	0.402887612	0.385849711	0.361755907	0.343618988	0.317132305	0.292939145	0.268686486	0.249530955	0.23629921	0.219497345	0.202633061	0.190475135	0.173926228	0.159021257	0.14876557	0.139307178	0.130283176	0.122236805	0.112315238	0.108717816	0.100272853	0.093802972	0.087937845	0.082270909	0.077330564	0.069392707	0.067556115	0.064532293	0.059599356	0.056480486	0.054560312	0.04935476	0.048419465	0.048052624	0.0405438	0.039248319	0.039117881	0.03442753	0.032998688	0.030079135	0.026712149	0.02795582	0.024357185	0.024055015	0.022227086	0.021827317	0.020420787	0.018436195	0.017370637	0.01659476	0.014733458	0.01337271	0.012851694	0.011118572	0.011046568	0.010501897	0.009107613	0.008279001	0.008079873	0.007376144	0.006972882	0.006145337	0.0060586	0.005755717	0.005742029	0.005445615	0.004703647	0.004732653	0.004056533	0.004052931	0.003147314	0.003376862	0.002671419	0.003194156	0.002596217	0.002181376	0.002116978	0.001812825	0.001934518	0.001852744	0.001634008	0.001457635	0.001479777	0.001068065	0.000920938	0.000872012	0.000765324	0.000727944	0.000631746	0.000628501	0.000509532	0.000333906	0.000412422	0.00038466	0.000309567	0.000364594	0.000436944	0.000249067	0.000267567	0.000401621	0.001029004	0.000243214	0.000404548	0.0002126];

data3 = [1	1.013059213	0.999831806	0.995449952	0.903435302	0.836330611	0.769369089	0.690987144	0.616968603	0.570017426	0.529767962	0.491303516	0.46271561	0.440345814	0.417556881	0.397572426	0.37959425	0.362374389	0.353225668	0.346294487	0.339077269	0.336375217	0.328338295	0.318979534	0.310750917	0.296140636	0.294115926	0.282696132	0.278699789	0.27357507	0.271009884	0.259695126	0.251951736	0.253207338	0.253207338	0.250641898	0.238622382	0.225850131	0.223335345	0.214625241	0.210588493	0.20121684	0.192061218	0.187393912	0.181877591	0.180187211	0.175064355	0.167365912	0.165236122	0.159657483	0.161583966	0.159964512	0.160224859	0.162300071	0.154549604	0.155969742	0.155897656	0.153540112	0.15157734	0.145866335	0.147287745	0.143741435	0.137644801	0.135572239	0.132438994	0.13400767	0.130681836	0.127638129	0.124989075	0.124447247	0.122828161	0.121061986	0.121339083	0.122684454	0.119840412	0.11780034	0.116212755	0.11537684	0.118872142	0.11514715	0.115006497	0.112294174	0.113999532	0.110510629	0.108132714	0.109651967	0.107852961	0.104794721	0.103741732	0.101603539	0.09833589	0.100834976	0.098912064	0.096826758	0.096264573	0.095514107	0.092217746	0.090497561	0.087158593	0.088429696	0.085231832	0.084868256	0.081020139	0.081326097	0.080358724	0.079202761	0.078595563	0.075160926	0.073124636	0.071612492	0.072163335	0.071580894	0.070882901	0.070517931	0.064138509	0.0641202	0.067564154	0.065470099	0.061619	0.058750314	0.057686319];

%% Plot subset with errorbars

% Data subet
data1 = [1	0.950549894	0.274434437	0.104402479	0.040483395	0.033024063	0.028618319	0.026433739	0.020531757	0.019080536	0.016960833	0.016219546	0.011137707	0.010969938	0.010838212	0.010346143	0.009824387	0.009800215	0.009211042	0.008736728	0.008503934];

data2 = [1	0.869565217	0.351528435	0.245369519	0.182741517	0.140161675	0.129747332	0.109294481	0.0965538	0.087240384	0.078041058	0.079372234	0.069345062	0.066624236	0.059338306	0.05793851	0.054820305	0.050619988	0.046545358	0.044139081	0.043560958];

data3 = [1	0.911696545	0.360007382	0.140177383	0.075455229	0.058523419	0.057081746	0.052692783	0.049193498	0.052388533	0.051951267	0.049996575	0.049477926	0.048130701	0.047129298	0.045638188	0.045740453	0.045703472	0.047024658	0.049837416	0.051105726];

all = [data1;data2;data3];
aver = mean(all);

x = linspace(0,10,21);
err = [0	0.033070882	0.038496906	0.059830256	0.060526165	0.04569645	0.042580031	0.034575509	0.031347239	0.027828521	0.025023992	0.02580284	0.024158669	0.023142875	0.020597632	0.020171101	0.019428044	0.01819484	0.017713618	0.018181383	0.018561702];

control =[1	0.98020013	0.959128142	0.929851423	0.947438036	0.932337547	0.922558975	0.902008036	0.898767719	0.895614301	0.894535449	0.892790719	0.873009023	0.862288669	0.853526065	0.856492535	0.832599541	0.818459281	0.824812869	0.820701328	0.818514755];

figure;
hold on
plot(x,aver,'Color','k')
errorbar(x,aver,err)
plot(x,control)
ylim([0 1])
