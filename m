From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/2] ARM:Tegra: Device Tree Support: Initialize the audio
 card from the device tree.
Date: Tue, 7 Jun 2011 11:44:01 +0800
Message-ID: <BANLkTik=Drbr4dQMYE3VLcjuxe+fZ--6RQ@mail.gmail.com>
References: <20110527205444.21000.90209.stgit@riker> <20110527205706.21000.34832.stgit@riker>
 <BANLkTi=NMjBjWVv_o3PocejhgGr8TdG+1Q@mail.gmail.com> <BANLkTi=PtEhxxmZo2DqvmySCmnEd3LbezQ@mail.gmail.com>
 <BANLkTikWpiY_o27OF-Jxvq7iPeWzrAYOsQ@mail.gmail.com> <20110602160445.GA8373@ponder.secretlab.ca>
 <20110602213656.GB10532@n2100.arm.linux.org.uk> <BANLkTimavC-6oMhAHHsBJ2_Em7aXi7eyNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTimavC-6oMhAHHsBJ2_Em7aXi7eyNQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2011/6/3 Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> 2011/6/3 Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>:
>> On Thu, Jun 02, 2011 at 10:04:45AM -0600, Grant Likely wrote:
>>> Right now we can't do dynamic registration for on-chip devices in a
>>> lot of cases because we don't have the infrastructure to hook up th=
e
>>> associated struct clks.
>>
>> I've been wondering about this, and I don't see it as a blocking pro=
blem
>> as you seem to be.
>>
>> I assume platform devices have stable names when they're created fro=
m
>> the device tree? =C2=A0If yes, there's no problem having the DT star=
t to
>> describe the SoC specific devices _today_ - all that the clk API usi=
ng
>> clkdev requires is a stable device name.
>
> when i write the following nodes in dts,
>
> uart0: uart@0xb0060000 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "sirf,uart";
> =C2=A0 =C2=A0 =C2=A0 =C2=A0...
> }
>
> uart1: uart@0xb0050000 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "sirf,uart";
> =C2=A0 =C2=A0 =C2=A0 =C2=A0...
> }
>
> uart2: uart@0xb0070000 {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "sirf,uart";
> =C2=A0 =C2=A0 =C2=A0 =C2=A0...
> }
>
> then create these platform devices by of_platform_xxx things, i get
> some platform devices like the below.
>
> b0060000.uart
> b0050000.uart
> b0070000.uart
>
> so these are the "stable names" you are talking about? or something e=
lse?

if so, we will need some clk_lookup table like:

#define CLK(_clk, _devname, _conname)                   \
        {                                               \
                .clk    =3D &clk_##_clk,                  \
                .dev_id =3D _devname,                     \
                .con_id =3D _conname,                     \
        }

CLK(uart0,      "b0060000.uart",        NULL),
CLK(uart1,      "b0050000.uart",        NULL),
CLK(uart2,      "b0070000.uart",        NULL),

it looks not like what we want too.

>
>>
>
