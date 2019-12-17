From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v3 08/15] ASoC: tegra: Add audio mclk control through
 clk_out_1 and extern1
Date: Mon, 16 Dec 2019 17:29:38 -0800
Message-ID: <41a7325c-9bb9-f681-4d30-d19079869d12@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-9-git-send-email-skomatineni@nvidia.com>
 <0ce2e83b-800c-da1e-7a3c-3cf1427cfe20@gmail.com>
 <2eeceabe-b5f0-6f9e-ff8c-4ac6167b7cc3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2eeceabe-b5f0-6f9e-ff8c-4ac6167b7cc3@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org


On 12/7/19 11:20 AM, Sowjanya Komatineni wrote:
>
> On 12/7/19 6:58 AM, Dmitry Osipenko wrote:
>> 06.12.2019 05:48, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Current ASoC driver uses extern1 as cdev1 clock from Tegra30 onwards
>>> through device tree.
>>>
>>> Actual audio mclk is clk_out_1 and to use PLLA for mclk rate control,
>>> need to clk_out_1_mux parent to extern1 and extern1 parent to=20
>>> PLLA_OUT0.
>>>
>>> Currently Tegra clock driver init sets the parents and enables both
>>> clk_out_1 and extern1 clocks. But these clocks parent and enables=20
>>> should
>>> be controlled by ASoC driver.
>>>
>>> Clock parents can be specified in device tree using assigned-clocks
>>> and assigned-clock-parents.
>>>
>>> To enable audio mclk, both clk_out_1 and extern1 clocks need to be
>>> enabled.
>>>
>>> This patch configures parents for clk_out_1 and extern1 clocks if=20
>>> device
>>> tree does not specify clock parents inorder to support old device tree
>>> and controls mclk using both clk_out_1 and extern1 clocks.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>> =C2=A0 sound/soc/tegra/tegra_asoc_utils.c | 66=20
>>> ++++++++++++++++++++++++++++++++++++++
>>> =C2=A0 sound/soc/tegra/tegra_asoc_utils.h |=C2=A0 1 +
>>> =C2=A0 2 files changed, 67 insertions(+)
>>>
>>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c=20
>>> b/sound/soc/tegra/tegra_asoc_utils.c
>>> index 536a578e9512..8e3a3740df7c 100644
>>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>>> @@ -60,6 +60,7 @@ int tegra_asoc_utils_set_rate(struct=20
>>> tegra_asoc_utils_data *data, int srate,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->set_mclk =3D 0;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->clk_c=
dev1);
>>> +=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->clk_extern1);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->clk_pll_a_ou=
t0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->clk_pll_a);
>>> =C2=A0 @@ -89,6 +90,14 @@ int tegra_asoc_utils_set_rate(struct=20
>>> tegra_asoc_utils_data *data, int srate,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (!IS_ERR_OR_NULL(data->clk_extern1)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D clk_prepare_enable(=
data->clk_extern1);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(data->dev, "Can't enable extern1: %d\n", err);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn err;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D clk_prepare_enable(data->clk_cde=
v1);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(data->de=
v, "Can't enable cdev1: %d\n", err);
>>> @@ -109,6 +118,7 @@ int tegra_asoc_utils_set_ac97_rate(struct=20
>>> tegra_asoc_utils_data *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->clk_c=
dev1);
>>> +=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->clk_extern1);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->clk_pll_a_ou=
t0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(data->clk_pll_a);
>>> =C2=A0 @@ -142,6 +152,14 @@ int tegra_asoc_utils_set_ac97_rate(struct=20
>>> tegra_asoc_utils_data *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (!IS_ERR_OR_NULL(data->clk_extern1)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D clk_prepare_enable(=
data->clk_extern1);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(data->dev, "Can't enable extern1: %d\n", err);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn err;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 }
>> Why this is needed given that clk_extern1 is either a child of MCLK or
>> MCLK itself (on T20)? The child clocks are enabled when the parent is
>> enabled.
>
> For T30 and later, clk_extern1 is one of the source for clk_out_1_mux.=20
> clk_extern1 is in CAR and it has its own gate and mux.
>
> As audio mclk related clocks (clk_out_1, clk_out_1_mux, and extern1)=20
> are moved into ASoC driver from clock driver
>
> need to enable extern1 gate as well along with clk_out1 for T30=20
> through T210.
>
> Just FYI, extern1 enable here happens only when data->clk_extern1 is=20
> available which is for T30 onwards.
>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D clk_prepare_enable(data->clk_cde=
v1);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(data->de=
v, "Can't enable cdev1: %d\n", err);
>>> @@ -158,6 +176,7 @@ EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_ac97_rate);
>>> =C2=A0 int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct device *dev)
>>> =C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0 struct clk *clk_out_1_mux;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->dev =3D dev;
>>> @@ -196,6 +215,51 @@ int tegra_asoc_utils_init(struct=20
>>> tegra_asoc_utils_data *data,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put_pll=
_a_out0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> In a previous patch you added fallback to EXTPERIPH when clk_get(MCLK)
>> fails. This will work perfectly fine for the older kernels which have
>> all clocks in the same single CaR driver, but this may not work that
>> great for the newer kernels because PMC driver isn't registered early
>> during boot and thus it is possible to get a legit -EPROBE_DEFER which
>> shouldn't be ignored. In other words, you need to add into this patch a
>> check for the error code returned by clk_get(MCLK) and fallback only for
>> -EINVAL.
> yeah right, will add check in next version.
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If clock parents are not set in DT, configu=
re here to use=20
>>> clk_out_1
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * as mclk and extern1 as parent for Tegra30 a=
nd higher.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 if (!of_find_property(dev->of_node, "assigned-clock=
-parents",=20
>>> NULL) &&
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->soc > TEGRA_ASOC_UTIL=
S_SOC_TEGRA20) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->clk_extern1 =3D clk_g=
et_sys("clk_out_1", "extern1");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(data->clk_extern=
1)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(data->dev, "Can't retrieve clk extern1\n");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D PTR_ERR(data->clk_extern1);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o err_put_cdev1;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D clk_set_parent(data=
->clk_extern1, data->clk_pll_a_out0);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(data->dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "Set parent failed for clk extern1: %d\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o err_put_cdev1;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_out_1_mux =3D clk_get_s=
ys(NULL, "clk_out_1_mux");
>> Note1: clk_get(dev, "clk_out_1_mux") should work here by letting clk
>> core to fall back to the clk_get_sys() by itself. Either way should=20
>> be good.

clk_get uses device rather and dev_id will be name of this device and=20
when clk_get fall back to __clk_get_sys() it still will use dev id of=20
this device rather than actual dev_id that pmc clocks are added to the=20
lookup. So clk_get_sys() seems to be correct to use as we can specify=20
exact dev_id and con_id.

Also, clk_find retrieves clock from lookup only when it finds matching=20
clock with both dev_id and con_id as pmc clocks are registered with both=20
dev_id and con_id.

I see existing clock driver adds both extern and pmc clocks (clk_out) to=20
lookup with same dev_id of clk_out_1/2/3 and con_id of extern1/2/3 and=20
with this always extern clock will be retrieved and this is probably=20
because old DT and audio driver always uses extern1 rather than actual=20
clk_out_1

But this need to be fixed now as we changed to use clk_out directly=20
rather than extern (even for other pmc clocks) to match actual hw design.

Will fix this as well to register pmc clocks using con_id as=20
clk_out_1/2/3 in pmc driver and extern clocks using con_id of=20
extern1/2/3 with dev_id being NULL so we can retrieve these clocks by=20
just using con_id only using clk_get_sys as we switched to use clk_out_1=20
directly as pmc clock rather than extern from DT and no longer need to=20
pair pmc clocks to extern clocks.

>>
>> Note2: devm_clk_get() could be used everywhere here. Maybe it won't hurt
>> to convert tegra_asoc_utils to use managed resources to keep code a bit
>> cleaner. It should be a separate patch.
>
> OK Will add patch to use devm_clk_get() in tegra_asoc_utils_init and=20
> will use same for these patches
>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(clk_out_1_mux)) =
{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(data->dev, "Can't retrieve clk clk_out_1_mux\n");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D PTR_ERR(clk_out_1_mux);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o err_put_cdev1;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D clk_set_parent(clk_=
out_1_mux, data->clk_extern1);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(data->dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "Set parent failed for clk_out_1_mux: %d\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ret);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk=
_put(clk_out_1_mux);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o err_put_cdev1;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> clk_put(clk_cdev1);
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->clk_cdev1 =3D clk_get=
_sys(NULL, "clk_out_1");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(data->clk_cdev1)=
) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev=
_err(data->dev, "Can't retrieve clk clk_out_1\n");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
 =3D PTR_ERR(data->clk_cdev1);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o err_put_cdev1;
>> goto err_put_pll_a_out0;
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D tegra_asoc_utils_set_rate(data, =
44100, 256 * 44100);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto err_put_cde=
v1;
>>> @@ -215,6 +279,8 @@ EXPORT_SYMBOL_GPL(tegra_asoc_utils_init);
>>> =C2=A0 =C2=A0 void tegra_asoc_utils_fini(struct tegra_asoc_utils_data *=
data)
>>> =C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0 if (!IS_ERR_OR_NULL(data->clk_extern1))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_put(data->clk_extern1);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_put(data->clk_cdev1);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_put(data->clk_pll_a_out0);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_put(data->clk_pll_a);
>>> diff --git a/sound/soc/tegra/tegra_asoc_utils.h=20
>>> b/sound/soc/tegra/tegra_asoc_utils.h
>>> index 0c13818dee75..5f2b96478caf 100644
>>> --- a/sound/soc/tegra/tegra_asoc_utils.h
>>> +++ b/sound/soc/tegra/tegra_asoc_utils.h
>>> @@ -25,6 +25,7 @@ struct tegra_asoc_utils_data {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk *clk_pll_a;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk *clk_pll_a_out0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk *clk_cdev1;
>>> +=C2=A0=C2=A0=C2=A0 struct clk *clk_extern1;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int set_baseclock;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int set_mclk;
>>> =C2=A0 };
>>>
