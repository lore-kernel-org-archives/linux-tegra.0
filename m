From: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v1] usb: chipidea: tegra: Use aligned DMA on Tegra30
Date: Thu, 21 Dec 2017 01:43:45 +0000
Message-ID: <HE1PR04MB1450F7254808F7C7D63E098A8B0D0@HE1PR04MB1450.eurprd04.prod.outlook.com>
References: <c574aabe51fa67e9a4bb9dc959c64ec6dcb232f1.1513651763.git.digetx@gmail.com>
 <20171220185915.GB9687@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220185915.GB9687@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

=20
> On Tue, Dec 19, 2017 at 05:58:07AM +0300, Dmitry Osipenko wrote:
> > USB Ethernet gadget now works on Tegra30.
> >
> > Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_tegra.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Peter
