From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [tegra:for-4.10/bus 4/4] drivers/bus/tegra-gmi.c:97:11: error:
 'dev' undeclared
Date: Tue, 8 Nov 2016 19:02:19 +0100
Message-ID: <20161108180217.GA32694@ulmo.ba.sec>
References: <201611080158.Q53HGK2q%fengguang.wu@intel.com>
 <20161108104745.GA3154@ulmo.ba.sec>
 <CALw8SCVXOqd=3B6tzE90TQa6S4BJSKmjV_Y3SrB6_Nc1_hsn+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALw8SCVXOqd=3B6tzE90TQa6S4BJSKmjV_Y3SrB6_Nc1_hsn+w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 01:13:02PM +0100, Mirza Krak wrote:
> 2016-11-08 11:47 GMT+01:00 Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
> > On Tue, Nov 08, 2016 at 01:44:03AM +0800, kbuild test robot wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.gi=
t for-4.10/bus
> >> head:   4f95e6a5c9e433197244c91dd25102a85dbb7877
> >> commit: 4f95e6a5c9e433197244c91dd25102a85dbb7877 [4/4] bus: Add suppor=
t for Tegra Generic Memory Interface
> >> config: arm-allmodconfig (attached as .config)
> >> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> >> reproduce:
> >>         wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-test=
s.git/plain/sbin/make.cross -O ~/bin/make.cross
> >>         chmod +x ~/bin/make.cross
> >>         git checkout 4f95e6a5c9e433197244c91dd25102a85dbb7877
> >>         # save the attached .config to linux build tree
> >>         make.cross ARCH=3Darm
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>    drivers/bus/tegra-gmi.c: In function 'tegra_gmi_parse_dt':
> >> >> drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use i=
n this function)
> >>       dev_err(dev, "no child nodes found\n");
> >>               ^~~
> >>    drivers/bus/tegra-gmi.c:97:11: note: each undeclared identifier is =
reported only once for each function it appears in
> >>
> >> vim +/dev +97 drivers/bus/tegra-gmi.c
> >>
> >>     91                struct device_node *child;
> >>     92                u32 property, ranges[4];
> >>     93                int err;
> >>     94
> >>     95                child =3D of_get_next_available_child(gmi->dev->=
of_node, NULL);
> >>     96                if (!child) {
> >>   > 97                        dev_err(dev, "no child nodes found\n");
> >>     98                        return -ENODEV;
> >>     99                }
> >>    100
> >
> > Sorry, this is my bad. I forgot to enable TEGRA_GMI in the default
> > configuration and that caused my build tests not to pick up the new
> > driver. Fixing it now.
>=20
> Yeah about that. It occurred to me that my patch series did include a
> patch that enables TEGRA_GMI in tegra_defconfig. Do not really know
> the policy on this, should there been a patch that enables it in
> tegra_defconfig? Or is usually managed later on?

It's usually a good idea to include such a patch in the series that adds
the driver, just so that it is more difficult to miss.

But no worries, it's all taken care of now.

Thanks,
Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIhMpAAoJEN0jrNd/PrOhODsP/jPu1reAVLTmYtbhTQMxjmUp
b6KIjivDvcCBEXpB4W5ss4L08WnT/SQnO8/6AefAbCuPwOs8oNNN+lUKDxuQM7Ci
oeX2U5DTmcPBjawLkVbUUWoW8OU9RpvE2ZJXcjv8qlKujaVBmeRSBf9E6Mg5zdcp
YRw3GZRnPL/GCl4ZSPLh57peGLRt74DMmZXODFRraIFJpUWYb4iqAvyhqkkh6sGH
1Y7HpS/+7VTB4HZOstr6IEdUmh0YEBSaJ+hmjI8CWqGLNXNIXHQ8N2lAGsGmCxik
6dYJCYo5w33ydcYbEVeN9XdF1mEdBeopuQkgc11HMh6CiaaIqyrZbojU8weoDgx7
UQYCPSE4MxFatgszyPDEhTs+VeVyCbV72gM3vphPANBRuN4XFgGaGNeIS5FLlIal
ka6vt9GhO4fYqSSITeoYaJxJf7Aa8IDi5MyeEi+TLJnzhu/+Sm/+yt5ugEBZzBMl
RyoK/Fm14s/6Z/zDzhnaQ2b+7nsoMGkf8JtPRoJJxe6XtuNmoXktVJcpklxnLeb9
rC5+XCz6xbvPaaBWihAXxSOoFprTTxzcHNKsmm1a5ei3yuxdGPuw7oo6xe+LkjJZ
/KTv8zCkpqQL8TeOOV/6YHkAElLE1zesbzAjzYLGlX6h3DlWfiHQSKHEg+HwFlNC
MyyNoyRwBA6aY1f8harM
=iIKZ
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
