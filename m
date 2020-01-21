From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 22/22] clk: tegra: Remove audio clocks configuration
 from clock driver
Date: Tue, 21 Jan 2020 08:19:47 -0800
Message-ID: <9765b723-33af-9863-72c9-8094203c8cb8@nvidia.com>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-23-git-send-email-skomatineni@nvidia.com>
 <d69fe7a8-71cc-c560-a567-f89b936753ad@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d69fe7a8-71cc-c560-a567-f89b936753ad-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 1/19/20 7:04 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 14.01.2020 10:24, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
> [snip]
>
>> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-teg=
ra30.c
>> index 5732fdbe20db..53d1c48532ae 100644
>> --- a/drivers/clk/tegra/clk-tegra30.c
>> +++ b/drivers/clk/tegra/clk-tegra30.c
>> @@ -1221,9 +1221,8 @@ static struct tegra_clk_init_table init_table[] __=
initdata =3D {
>>        { TEGRA30_CLK_UARTC, TEGRA30_CLK_PLL_P, 408000000, 0 },
>>        { TEGRA30_CLK_UARTD, TEGRA30_CLK_PLL_P, 408000000, 0 },
>>        { TEGRA30_CLK_UARTE, TEGRA30_CLK_PLL_P, 408000000, 0 },
>> -     { TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 1 },
>> -     { TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 1 },
>> -     { TEGRA30_CLK_EXTERN1, TEGRA30_CLK_PLL_A_OUT0, 0, 1 },
>> +     { TEGRA30_CLK_PLL_A, TEGRA30_CLK_CLK_MAX, 564480000, 0 },
>> +     { TEGRA30_CLK_PLL_A_OUT0, TEGRA30_CLK_CLK_MAX, 11289600, 0 },
>>        { TEGRA30_CLK_I2S0, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
>>        { TEGRA30_CLK_I2S1, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
>>        { TEGRA30_CLK_I2S2, TEGRA30_CLK_PLL_A_OUT0, 11289600, 0 },
>>
> What about to use the assigned-clock-rates in device-tree and thus to
> remove those PLL_A entries?

Yes clock rates can be used and also PLL rate is set based on sample=20
rate during hw_params. So this can be removed.

But PLLA clock rates are not related to this patch series and also=20
changing this needs audio function testing across all platforms and=20
currently we don't have audio functional tests in place for older platforms=
.

All audio clocks proper fixes and cleanup b/w clock driver and audio=20
driver will be done separately.
