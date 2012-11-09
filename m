From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm: tegra: Add HDMI support
Date: Fri, 9 Nov 2012 16:45:19 +0100
Message-ID: <CACna6rycZ=TGHP7KpVa_r0JSpc6c=PB89pijR9E_4A=bQ=74Bw@mail.gmail.com>
References: <1352469579-3337-1-git-send-email-thierry.reding@avionic-design.de>
	<1352469579-3337-3-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352469579-3337-3-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2012/11/9 Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>:
> +/* all fields little endian */
> +struct hdmi_audio_infoframe {
> +       /* PB0 */
> +       u8 csum;
> +
> +       /* PB1 */
> +       unsigned cc:3; /* channel count */
> +       unsigned res1:1;
> +       unsigned ct:4; /* coding type */
> +
> +       /* PB2 */
> +       unsigned ss:2; /* sample size */
> +       unsigned sf:3; /* sample frequency */
> +       unsigned res2:3;
> +
> +       /* PB3 */
> +       unsigned cxt:5; /* coding extention type */
> +       unsigned res3:3;
> +
> +       /* PB4 */
> +       u8 ca; /* channel/speaker allocation */
> +
> +       /* PB5 */
> +       unsigned res5:3;
> +       unsigned lsv:4; /* level shift value */
> +       unsigned dm_inh:1; /* downmix inhibit */
> +
> +       /* PB6-10 reserved */
> +       u8 res6;
> +       u8 res7;
> +       u8 res8;
> +       u8 res9;
> +       u8 res10;
> +} __packed;

I was told it won't work on different endian devices. See
[RFC][PATCH] drm/radeon/hdmi: define struct for AVI infoframe
http://lists.freedesktop.org/archives/dri-devel/2012-May/022544.html

--=20
Rafa=C5=82
