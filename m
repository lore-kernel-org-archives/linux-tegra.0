From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v2 00/11] Move PMC clocks into Tegra PMC driver
Date: Wed, 27 Nov 2019 09:02:35 -0800
Message-ID: <04b093fe-5eff-1ad2-9a8a-7674dcb2318a@nvidia.com>
References: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
 <79e7bd6a-f138-1e7d-6e0b-435adde3b3e5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <79e7bd6a-f138-1e7d-6e0b-435adde3b3e5@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, sboyd@kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 11/27/19 6:31 AM, Dmitry Osipenko wrote:
> 27.11.2019 07:59, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
>> are currently registered by Tegra clock driver using clk_regiser_mux and
>> clk_register_gate which performs direct Tegra PMC register access.
>>
>> When Tegra PMC is in secure mode, any access from non-secure world will
>> not go through.
>>
>> This patch series adds these Tegra PMC clocks and blink controls to Tegr=
a
>> PMC driver with PMC as clock provider and removed them from Tegra clock
>> driver. This also adds PMC specific clock id's to use in device tree and
>> removed clock ids of PMC clock from Tegra clock driver.
>>
>> This series also includes patch to update clock provider from tegra_car
>> to pmc in the device tree tegra210-smaug.dts that uses clk_out_2 from PM=
C.
>>
>> [v2]:	Changes between v1 and v2 are
>> 	- v2 includes patches for adding clk_out_1, clk_out_2, clk_out_3,
>> 	  blink controls to Tegra PMC driver and removing clk-tegra-pmc.
>> 	- feedback related to pmc clocks in Tegra PMC driver from v1
>> 	- Removed patches for WB0 PLLM overrides and PLLE IDDQ PMC programming
>> 	  by the clock driver using helper functions from Tegra PMC.
>>
>>   	  Note:
>> 	  To use helper functions from PMC driver, PMC early init need to
>> 	  happen prior to using helper functions and these helper functions are
>> 	  for PLLM Override and PLLE IDDQ programming in PMC during PLLM/PLLE
>> 	  clock registration which happen in clock_init prior to Tegra PMC
>> 	  probe.
>> 	  Moving PLLM/PLLE clocks registration to happen after Tegra PMC
>> 	  impacts other clocks EMC, MC and corresponding tegra_emc_init and
>> 	  tegra_mc_init.
>> 	  This implementation of configuring PMC registers thru helper
>> 	  functions in clock driver needs proper changes across PMC, Clock,
>> 	  EMC and MC inits to have it work across all Tegra platforms.
>>
>> 	  Currently PLLM Override is not enabled in the bootloader so proper
>> 	  patches for this fix will be taken care separately.
> Hello Sowjanya,
>
> Could you please clarify what do you mean by "PLLM Override not enabled
> in bootloader"?
>
> There is T124 Nyan Big Chromebook which is supported in upstream kernel,
> it has PLLM Override set by bootloader. I also have T30 Nexus 7 tablet
> which has the PLLM Override set by bootloader as well. It's not clear to
> me whether this patch series is supposed to break these devices. If the
> breakage is the case here, then I'm afraid you can't postpone supporting
> the PLLM Override and a full-featured implementation is needed.

Hi Dmitry,

Secure boot currently is enabled only on Tegra210 and Tegra210=20
bootloader doesn't enable PLLM override.

So PLLM override/PLLE IDDQ being in clock driver currently will not=20
break on any of existing Tegra platforms.

>
> I briefly tried to test this series on T30 and this time it doesn't hang
> on boot, but somehow WiFi MMC card detection is broken. AFAIK, the WiFi
> chip uses the Blink clock source and the clock should be enabled by the
> MMC core because this is how DT part looks like:
>
> brcm_wifi_pwrseq: wifi-pwrseq {
> 	compatible =3D "mmc-pwrseq-simple";
> 	clocks =3D <&pmc TEGRA_PMC_CLK_BLINK>;
> 	clock-names =3D "ext_clock";
> 	reset-gpios =3D  <&gpio TEGRA_GPIO(D, 3) GPIO_ACTIVE_LOW>;
> 	post-power-on-delay-ms =3D <300>;
> 	power-off-delay-us =3D <300>;
> };
>
> BTW, I  tried this series on a T20 device which also uses the Blink
> clock for WiFi card and it works. So looks like this patchset has some
> problem in regards to the T30 PMC clocks implementation.
>
> [snip]

Blink init state is set to true for both Tegra20 and Tegra30 and all go=20
through the same blink programming sequence.

Will try to add more debug messages to dump registers and will test=20
blink through device tree on T30 and will get back...
