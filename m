From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 4/9] ASoC: tegra: add Tegra210 based I2S driver
Date: Fri, 7 Feb 2020 16:53:45 +0530
Message-ID: <bea2a750-3ef0-21ab-a8ac-d76b6d1a23e0@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-5-git-send-email-spujar@nvidia.com>
 <3a586a6b-5f53-dc44-b9fc-67c633c626ef@gmail.com>
 <90ae7badcb3441daa8144233de8f6825@AcuMS.aculab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <90ae7badcb3441daa8144233de8f6825@AcuMS.aculab.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: David Laight <David.Laight@ACULAB.COM>, 'Dmitry Osipenko' <digetx@gmail.com>
Cc: spujar@nvidia.com, "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sharadg@nvidia.com" <sharadg@nvidia.com>, "mkumard@nvidia.com" <mkumard@nvidia.com>, "viswanathl@nvidia.com" <viswanathl@nvidia.com>, "rlokhande@nvidia.com" <rlokhande@nvidia.com>, "dramesh@nvidia.com" <dram>
List-Id: linux-tegra@vger.kernel.org



On 2/6/2020 10:36 PM, David Laight wrote:
> External email: Use caution opening links or attachments
>
>
> From: f Dmitry Osipenko
>> Sent: 06 February 2020 16:59
>>
>> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> ...
>>> +static const int tegra210_cif_fmt[] =3D {
>>> +   0,
>>> +   TEGRA_ACIF_BITS_16,
>>> +   TEGRA_ACIF_BITS_32,
>>> +};
>>> +
>>> +static const int tegra210_i2s_bit_fmt[] =3D {
>>> +   0,
>>> +   I2S_BITS_16,
>>> +   I2S_BITS_32,
>>> +};
>>> +
>>> +static const int tegra210_i2s_sample_size[] =3D {
>>> +   0,
>>> +   16,
>>> +   32,
>>> +};
>> static const *unsigned* int?
> Or get rid of the table lookups completely.
> Assuming the index is never zero then the value
> can be calculated as (const_a + const_b * index).

All above tables are mapped to tegra210_i2s_format_text[].=20
Additions/removal of entries will require changes in equation. It is=20
better keep the mapping as it is.
>
>          David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)
