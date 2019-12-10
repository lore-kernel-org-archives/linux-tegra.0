From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
Date: Tue, 10 Dec 2019 15:57:50 +0100
Message-ID: <8ff73b97-cf2e-0c91-2764-05ce4c548b06@suse.de>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191210132146.GF2703785@ulmo>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>, "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>, "heiko@sntech.de" <heiko@sntech.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, Yangtao Li <tiny.windzz@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "palmer@sifive.com" <palmer@sifive.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "rfontana@redhat.com" <rfontana@redhat.com>, "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>, Fabien DESSENNE <fabien.dessenne@st.com>, "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Leonard Crestez <leonard.crestez@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

Am 10.12.19 um 14:21 schrieb Thierry Reding:
> On Mon, Dec 09, 2019 at 08:44:39PM +0000, Leonard Crestez wrote:
>> On 09.12.2019 21:58, Yangtao Li wrote:
>>> Use devm_platform_ioremap_resource() to simplify code.
>>>
>>> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
>>> ---
>>>   drivers/clk/imx/clk-imx8qxp-lpcg.c | 6 +-----
>>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
>>> index c0aff7ca6374..10ae712447c6 100644
>>> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
>>> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
>>> @@ -164,7 +164,6 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
>>>   	struct clk_hw_onecell_data *clk_data;
>>>   	const struct imx8qxp_ss_lpcg *ss_lpcg;
>>>   	const struct imx8qxp_lpcg_data *lpcg;
>>> -	struct resource *res;
>>>   	struct clk_hw **clks;
>>>   	void __iomem *base;
>>>   	int i;
>>> @@ -173,10 +172,7 @@ static int imx8qxp_lpcg_clk_probe(struct platform_device *pdev)
>>>   	if (!ss_lpcg)
>>>   		return -ENODEV;
>>>   
>>> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> -	if (!res)
>>> -		return -EINVAL;
>>> -	base = devm_ioremap(dev, res->start, resource_size(res));
>>> +	base = devm_platform_ioremap_resource(pdev, 0);
>>>   	if (!base)
>>>   		return -ENOMEM;
>> This breaks imx8qxp-mek boot by causing most peripherals (like uart) to 
>> fail to probe.
>>
>> The old and new paths are not equivalent: devm_platform_ioremap_resource
>> calls devm_ioremap_resource which differs from devm_ioremap by also 
>> calling devm_request_mem_region.
>>
>> This prevents other mappings in the area and imx8qxp-lpcg nodes map 
>> whole hardware "subsystems" and overlap most peripherals. For example:
>>
>>                   adma_lpcg: clock-controller@59000000 {
>>                           compatible = "fsl,imx8qxp-lpcg-adma";
>>                           reg = <0x59000000 0x2000000>;
>>                           #clock-cells = <1>;
>> 		};
>>
>>                  adma_lpuart0: serial@5a060000 {
>> 			reg = <0x5a060000 0x1000>;
>> 			...
>> 		};
> The whole point of doing a request_mem_region() is to avoid having
> multiple drivers trample on each others' mappings. What you do above
> doesn't look right. Why does that clock controller need access to 32
> MiB of I/O memory space?

I have similar cases with Realtek where registers are simply not grouped
into convenient blocks but spread across large memory regions.

Also, Fabien and I had a review discussion about the very same topic of
suggesting these functions which implicitly do a request_mem_region(),
so this might need some better documentation for raising awareness?

For some cases I posted patches to convert those to syscon / simple-mfd,
but clk in particular is a difficult one: clks still express their
parents by names rather than pointers, and having clks spread across
drivers has implications on needing to expose non-leaf clocks in the DT
bindings, as well as needing to mess with __clk_get_name() for actually
getting the name to use as parent when obtaining the clk from DT.
Imagine a lonely clk gate register and the PLLs or other gates they are
supplied from residing far away. It's really ugly either way...

That said, the Actions Semi patch 16/17 that I'm CC'ed for looks okay.

Regards,
Andreas

> 
> That said, there are legitimate reasons for sharing mappings across
> drivers, so I agree that automated conversions like this should be done
> very carefully. The difficulty is that there are cases where drivers
> simply omitted that request_mem_region() by mistake and where the
> conversion can be correct (and in fact an improvement), but we can't
> make the assumption blindly.
> 
> Thierry
> 
>> I don't know if this issue affects any other platforms (imx8 lpcg 
>> bindings are unusual) but if you found this with an automated tool 
>> perhaps it should be adjusted?
>>
>> By my count it's the 4th time this incorrect cleanup was posted.
>>
>> Previously: https://lkml.org/lkml/2019/12/4/487
>>
>> --
>> Regards,
>> Leonard


-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
