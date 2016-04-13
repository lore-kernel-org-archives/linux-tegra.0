From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4 2/3] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Wed, 13 Apr 2016 11:20:21 -0600
Message-ID: <570E7FD5.40303@wwwdotorg.org>
References: <1458057390-20756-1-git-send-email-jonathanh@nvidia.com>
 <1458057390-20756-3-git-send-email-jonathanh@nvidia.com>
 <20160405213649.GA11586@vkoul-mobl.iind.intel.com>
 <570BB001.3020202@nvidia.com> <20160412141025.GJ2274@localhost>
 <570D2104.1040607@nvidia.com> <20160413134917.GP2274@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160413134917.GP2274@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/13/2016 07:49 AM, Vinod Koul wrote:
> On Tue, Apr 12, 2016 at 05:23:32PM +0100, Jon Hunter wrote:
>>>>> why should this be hard coded in kernel and not queried from something like
>>>>> DT? This case seems to be hardware property
>>>>
>>>> Originally, I did have this in DT, however, the Tegra maintainers prefer
>>>> this and this is consistent with the other Tegra DMA driver (see
>>>> driver/dma/tegra20-apb-dma.c) [0].
>>>
>>> But this creates a problem when you have next generation of controller with
>>> different channel count!
>>> How do we solve then?
>>
>> Same way we solve this for the tegra20-apb-dma driver by having
>> different chip data per SoC in the driver ...
>>
>> 1259 /* Tegra20 specific DMA controller information */
>> 1260 static const struct tegra_dma_chip_data tegra20_dma_chip_data = {
>> 1261         .nr_channels            = 16,
>> 1262         .channel_reg_size       = 0x20,
>> 1263         .max_dma_count          = 1024UL * 64,
>> 1264         .support_channel_pause  = false,
>> 1265         .support_separate_wcount_reg = false,
>> 1266 };
>> 1267
>> 1268 /* Tegra30 specific DMA controller information */
>> 1269 static const struct tegra_dma_chip_data tegra30_dma_chip_data = {
>> 1270         .nr_channels            = 32,
>> 1271         .channel_reg_size       = 0x20,
>> 1272         .max_dma_count          = 1024UL * 64,
>> 1273         .support_channel_pause  = false,
>> 1274         .support_separate_wcount_reg = false,
>> 1275 };
>> 1276
>> 1277 /* Tegra114 specific DMA controller information */
>> 1278 static const struct tegra_dma_chip_data tegra114_dma_chip_data = {
>> 1279         .nr_channels            = 32,
>> 1280         .channel_reg_size       = 0x20,
>> 1281         .max_dma_count          = 1024UL * 64,
>> 1282         .support_channel_pause  = true,
>> 1283         .support_separate_wcount_reg = false,
>> 1284 };
>> 1285
>> 1286 /* Tegra148 specific DMA controller information */
>> 1287 static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
>> 1288         .nr_channels            = 32,
>> 1289         .channel_reg_size       = 0x40,
>> 1290         .max_dma_count          = 1024UL * 64,
>> 1291         .support_channel_pause  = true,
>> 1292         .support_separate_wcount_reg = true,
>> 1293 };
>>
>> You may still say this should be in the DT, but the Tegra maintainers
>> prefer this data in the driver.
>
> Okay I don't see a a rationale behind this not being in DT, Stephan?

The rationale for putting such data into DT is that when a new SoC comes 
out, someone can simply modify the DT to change the parameter and the 
existing driver will magically work on the new HW.

In practice, at least for HW blocks on Tegra, this doesn't turn out to 
be true very often at all. We almost /always/ need some change to the 
driver, because it needs to manipulate some additional clock, program 
some new register/field, adapt to register/field layout changes, work 
around bugs differently, etc. As such, expecting driver code changes is 
the norm not the exception.

Given that, we have two choices about how to represent certain data in DT:

a) Put (hard-code) the data into the driver, and just use it. Perhaps 
this data is in a table in order to support different values per SoC, as 
in the code quoted above. This is very simple.

b) Put the data into DT, and write extra driver code to parse it, all 
just to extract the exact same value we would have hard-coded into the 
driver. This is useless overhead /unless/ it allows re-use of the driver 
unchanged on new SoCs, which rarely happens.

As such, it's much simpler to choose option (a).

If an initial version of a driver hard-codes some value and by magic a 
new version of the HW comes out for which the only difference is some 
value like this, then:

a) It's likely that the value has increased rather than decreased on new 
HW, so the existing hard-coded driver can work just as well as on old 
HW, but simply not exposing all HW capabilities. This won't always be 
true, but seems just as reasonable to expect as expecting the driver 
won't need modifications for any other reason.

b) At the time we add driver support for the new chip, we can define a 
new DT property that represents the previously hard-coded data. If the 
property is present, its value is used. Otherwise the previous 
hard-coded default can still be used. This allows us to retrospectively 
realise that a DT property would have been a good idea, yet not bog the 
code down with using the DT property until it is definitively known to 
be useful.


Now, my points above all refer to Tegra HW blocks. Hopefully they don't 
apply to IP vendors who sell their block to various SoC vendors. There, 
it's much more obviously beneficial to allow DT-based configuration of 
any IP block parameters, since different SoC vendors will almost 
certainly pick different configuration values if it's possible to do so. 
Note that this is more about different instances (parameterizations) of 
the same version of an IP block though.

Equally,, my points apply to on-SoC HW blocks rather than anything board 
specific. Board designs very obviously vary a lot, and it's obviously 
beneficial to use DT to represent those differences (for consumption by 
a generic OS; there's not so much benefit when talking about firmware 
consuming DT).
