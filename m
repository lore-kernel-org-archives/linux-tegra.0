From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC 7/8] Start migrating XUSB away from MFD
Date: Mon, 2 Nov 2015 13:27:37 +0000
Message-ID: <20151102132737.GX4058@x1>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
 <1446465323-9493-8-git-send-email-martyn.welch@collabora.co.uk>
 <20151102124732.GW4058@x1>
 <56376389.8030806@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56376389.8030806@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: linux-tegra@vger.kernel.org, thierry.reding@gmail.com, swarren@wwwdotorg.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, abrestic@chromium.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 02 Nov 2015, Martyn Welch wrote:
> On 02/11/15 12:47, Lee Jones wrote:
> >On Mon, 02 Nov 2015, Martyn Welch wrote:
> >
> >>From: Martyn Welch <martyn@welchs.me.uk>
> >>
> >>This is my initial attempt to get xusb working without being a MFD =
on the
> >>latest upstream kernel. It's still a bit hacky in places, but does =
seem to
> >>get the USB2 up and working (USB3 device is recognised as a USB3 de=
vice
> >>rather than enumberating as a USB2 device).
> >After my 20 second look at the 2 patches of this set you sent me, I'=
ve
> >concluded that it looks barking mad.  In patch 2 you're adding the
> >XUSB MFD driver, then in this patch you're telling us that you're
> >moving away from MFD despite adding more code to the subsystem.
>=20
> Hi Lee,
>=20
> Sorry, seems git send-email added you of it's own volition.
>=20
> I've sent these patches to the mailing list for comment/help not for
> submission. As mentioned in the cover email, the first 5 patches are
> from an existing series that has been rejected. The later 3 patches
> show my modifications. I have not yet moved these files from the MFD
> directory, but will before submission (the series will be reworked
> so that the driver never goes into the MFD area).

Okay, very well.

> >Besides, I'm never applying a patch that self confesses to be "hacky
> >in places" into Mainline, ever.
>=20
> As I mentioned before, I'm posting these patches for comment (hence
> why I've marked them as "RFC" not "PATCH").

I did notice that this was an RFC -- and this was my Comment. ;)

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
