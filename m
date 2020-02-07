From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/9] ASoC: tegra: add Tegra210 based DMIC driver
Date: Fri, 7 Feb 2020 16:36:24 +0530
Message-ID: <3e89e75d-2f5a-dc42-98f7-8e1262afe380@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-4-git-send-email-spujar@nvidia.com>
 <9ada4090-169e-0767-db5d-739f6e621812@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9ada4090-169e-0767-db5d-739f6e621812-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2/6/2020 10:23 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static const struct reg_default tegra210_dmic_reg_defaults[] =3D {
>> +     { TEGRA210_DMIC_TX_INT_MASK, 0x00000001},
>> +     { TEGRA210_DMIC_TX_CIF_CTRL, 0x00007700},
>> +     { TEGRA210_DMIC_CG, 0x1},
>> +     { TEGRA210_DMIC_CTRL, 0x00000301},
>> +     /* Below enables all filters - DCR, LP and SC */
>> +     { TEGRA210_DMIC_DBG_CTRL, 0xe },
>> +     /* Below as per latest POR value */
>> +     { TEGRA210_DMIC_DCR_BIQUAD_0_COEF_4, 0x0},
>> +     /* LP filter is configured for pass through and used to apply gain=
 */
>> +     { TEGRA210_DMIC_LP_BIQUAD_0_COEF_0, 0x00800000},
>> +     { TEGRA210_DMIC_LP_BIQUAD_0_COEF_1, 0x0},
>> +     { TEGRA210_DMIC_LP_BIQUAD_0_COEF_2, 0x0},
>> +     { TEGRA210_DMIC_LP_BIQUAD_0_COEF_3, 0x0},
>> +     { TEGRA210_DMIC_LP_BIQUAD_0_COEF_4, 0x0},
>> +     { TEGRA210_DMIC_LP_BIQUAD_1_COEF_0, 0x00800000},
>> +     { TEGRA210_DMIC_LP_BIQUAD_1_COEF_1, 0x0},
>> +     { TEGRA210_DMIC_LP_BIQUAD_1_COEF_2, 0x0},
>> +     { TEGRA210_DMIC_LP_BIQUAD_1_COEF_3, 0x0},
>> +     { TEGRA210_DMIC_LP_BIQUAD_1_COEF_4, 0x0},
>> +};
> I'd add a space on the right side of `}`, for consistency with the left.

Do you mean like this?
{ TEGRA210_DMIC_TX_INT_MASK, 0x00000001 },
{ TEGRA210_DMIC_TX_CIF_CTRL, 0x00007700 },
 =C2=A0=C2=A0=C2=A0 . . .
