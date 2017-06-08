From: <Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org>
Subject: Re: u-boot-flasher fails with current u-boot
Date: Thu, 8 Jun 2017 04:00:55 +0000
Message-ID: <84o9tzuo09.wl-Peter.Chubb@data61.csiro.au>
References: <84tw3sk7sq.wl-Peter.Chubb@data61.csiro.au>
        <CAPnjgZ08jAH7OgTwQj6m5E1R26AqkwBiZEnPxHwWr==K=f9oWQ@mail.gmail.com>
        <848tl430qh.wl-Peter.Chubb@data61.csiro.au>
        <84vao7uvsz.wl-Peter.Chubb@data61.csiro.au>
        <CAPnjgZ3GhGGq8SrtXNOQyh5V7Xm2X_pfKcrrbHkyVNXcfvWCjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ3GhGGq8SrtXNOQyh5V7Xm2X_pfKcrrbHkyVNXcfvWCjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Content-ID: <9D3DF0FB9DA7574A9EFC2AFD4047F7EE-uXK74I8fpZ0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: Peter.Chubb-RgbkMxAV74wUb6iz2VnApA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

>>>>> "Simon" =3D=3D Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> writes:


Simon> The good news is I found my Jetson-TK1 and I can repeat your
Simon> problem.

Cool.  So it's not just me (phew)
>>=20
>> Tegra124 (Jetson TK1) # mmc rescan

Simon> Why are you running 'mmc rescan'? Is this because the MMC has
Simon> changed?

Any mmc command fails except 'mmc part' and 'mmc list'.  'mmc rescan'
was just one example that should work.

Tegra124 (Jetson TK1) # mmc dev
tegra_mmc_send_cmd_bounced: MMC Timeout
    Interrupt status        0x00000001
    Interrupt status enable 0xffff003b
    Interrupt signal enable 0xffff0002
    Present status          0x01fb02f6
mmc_init: -1, time 8042

Tegra124 (Jetson TK1) # mmc info                                           =
    =20
mmc_init: -1, time 4

--
Dr Peter Chubb         Tel: +61 2 9490 5852      http://ts.data61.csiro.au/
Trustworthy Systems Group                           Data61 (formerly NICTA)=
