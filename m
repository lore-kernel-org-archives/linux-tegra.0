From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v3 06/15] clk: tegra: Remove tegra_pmc_clk_init along with
 clk ids
Date: Sat, 7 Dec 2019 11:35:18 -0800
Message-ID: <c81ccd45-781e-0fce-4f20-65281b8c6119@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-7-git-send-email-skomatineni@nvidia.com>
 <3880aa15-c47a-5ab2-dd39-e8a47f6a3d6a@gmail.com>
 <e342a6e7-f213-53b4-1388-23cf61cf6fbb@gmail.com>
 <5938df22-2474-3950-fc33-3e19cbf3da9c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5938df22-2474-3950-fc33-3e19cbf3da9c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, alexios.zavras@intel.com, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org


On 12/7/19 7:04 AM, Dmitry Osipenko wrote:
> 07.12.2019 17:43, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 07.12.2019 17:33, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> 06.12.2019 05:48, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Current Tegra clock driver registers PMC clocks clk_out_1, clk_out_2,
>>>> clk_out_3 and blink output in tegra_pmc_init() which does direct Tegra
>>>> PMC access during clk_ops and these PMC register read and write access
>>>> will not happen when PMC is in secure mode.
>>>>
>>>> Any direct PMC register access from non-secure world will not go
>>>> through and all the PMC clocks and blink control are done in Tegra PMC
>>>> driver with PMC as clock provider.
>>>>
>>>> This patch removes tegra_pmc_clk_init along with corresponding clk ids
>>>> from Tegra clock driver.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>> [snip]
>>>
>>>> @@ -1230,9 +1222,6 @@ static struct tegra_clk_init_table init_table[] =
__initdata =3D {
>>>>   	{ TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 1 },
>>>>   	{ TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 1 },
>>>>   	{ TEGRA30_CLK_EXTERN1, TEGRA30_CLK_PLL_A_OUT0, 0, 1 },
>>> Perhaps these clocks do not need to be always-enabled?
>>>
>>> [snip]
>>>
>> Also, EXTERN1 parent configuration should be moved to the audio
>> driver/device-tree as well.
> Ah, I missed that it's done in the patch #10.
Yes its done in Patch#10
>
>> Maybe it even makes sense to move the whole configuration, including
>> PLLA. I don't see why clk driver need to do something for the audio driv=
er.

Current ASoC driver already takes care of PLLA rate and enables.

So PLLA init can be removed from clock driver too. I didn't went through=20
complete audio driver to be confident to remove this.

But PLLA is needed for i2s clock also and currently I2S driver takes=20
care of only I2S clock rate using PLLA as parent set by clock driver and=20
clock driver enables PLLA earlier to have it ready by the time both I2S=20
driver and ASoC driver .
