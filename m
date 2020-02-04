From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: sound: tegra: add DT binding for AHUB
Date: Tue, 4 Feb 2020 09:54:34 +0530
Message-ID: <62ea74fe-1f3c-e56c-669f-9a2dd9c02412@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-2-git-send-email-spujar@nvidia.com>
 <32d6c62d-0ac4-54e0-2efb-9f9a8cf2d271@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <32d6c62d-0ac4-54e0-2efb-9f9a8cf2d271-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2/4/2020 1:49 AM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 30.01.2020 13:33, Sameer Pujar =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          const: nvidia,tegra210-i2s
>> +      - items:
>> +          - enum:
>> +              - nvidia,tegra194-i2s
>> +              - nvidia,tegra186-i2s
>> +          - enum:
>> +              - nvidia,tegra210-i2s
> Couldn't this be something like this:
>
> properties:
>    compatible:
>      - enum:
>        - nvidia,tegra210-i2s
>        - nvidia,tegra186-i2s
>        - nvidia,tegra194-i2s

I used that way because,
For Tegra210: compatible =3D "nvidia,tegra210-i2s";
For Tegra186: compatible =3D "nvidia,tegra186-i2s", "nvidia,tegra210-i2s";=
=20
(future proof)
For Tegra194: compatible =3D "nvidia,tegra194-i2s", "nvidia,tegra210-i2s";=
=20
(future proof)

Currently driver uses "nvidia,tegra210-i2s" alone.

YAML binding check fails otherwise as it does not let me have future=20
proof bindings.
