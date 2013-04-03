From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: CPU idle LP2 breaks MSI on TrimSlice
Date: Wed, 3 Apr 2013 10:40:36 +0200
Message-ID: <20130403084036.GA28417@avionic-0098.mockup.avionic-design.de>
References: <20130403075454.GA25174@avionic-0098.mockup.avionic-design.de>
 <1364976857.16957.56.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364976857.16957.56.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2013 at 04:14:17PM +0800, Joseph Lo wrote:
> On Wed, 2013-04-03 at 15:54 +0800, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > Hi Joseph,
> >=20
> > I didn't want to hijack the other thread, so I'm starting a new one.
> > I've recently been trying to get the PCIe ethernet device on TrimSlice
> > working on top of the Tegra PCIe rework patches that I've been carrying
> > for quite a while.
> >=20
> > A bit of background: when I last tried this back in January things still
> > worked fine, but I noticed that they aren't working on recent linux-next
> > versions. I was able to track down next-20130123 as the last working
> > version and next-20130128 as the first broken one (anything in between
> > didn't boot properly).
> >=20
> > It turns out that the introduction of CPU idle (LP2) seems to have
> > introduced this breakage. Normally what I'd do is:
> >=20
> > 	$ ifconfig eth0 up
> >=20
> > and wait for a few seconds for the kernel to report that a link has been
> > detected, after which running
> >=20
> > 	$ dhcpcd eth0
> >=20
> > will successfully obtain an IP address. However, with the CPU idle
> > support enabled, the network interface no longer detects a link. The
> > reason for this is that the MSI that would usually occur after link
> > detection by the hardware never occurs when LP2 is enabled.
> >=20
> > I've verified on top of next-20130402 that commenting out entry "1" in
> > tegra_idle_states (LP2) in cpuidle-tegra20.c "fixes" the issue. I'm able
> > to obtain an IP address via DHCP and use the network interface as usual.
> >=20
> > I already talked to Stephen and Peter about this on IRC and none of us
> > could come up with a good explanation. Since you wrote the CPU idle
> > support I thought you might be able to shed some light on this.
> >=20
> Do you mean after enabling CPU idle LP2 the PCIe ethernet driver not
> work anymore?

The driver still works, there is no crash or anything. But the MSI is no
longer received by the CPU. I'm not even sure the network driver is in
any way involved here, because the MSI functionality is provided by the
Tegra PCIe controller driver.

> Does the driver use any runtime PM and generic power domain that hook
> to the LP2 state of CPU idle?

The driver does indeed use the generic pm_runtime_*() functions. I'm not
sure how much they can influence the LP2 state, though.

> Can you point me out the driver source? Because I don't have any device
> that support PCIe interface. I may not have chance to repo this.

The network driver is drivers/net/ethernet/realtek/r8169.c, and you can
find the PCIe controller driver (which provides the MSI functionality)
here[0].

> But normally, the idle driver should not break driver.

I agree. Some of the speculations on IRC included that the MSI might be
lost due to the interrupt controller not waking up the CPU properly to
deliver the interrupt or maybe the interrupt was delivered to the wrong
CPU and therefore lost. But I don't know either the interrupt controller
or CPU idle in enough detail to substantiate those.

> BTW, you can also check the minimal interval to keep the connection
> alive. For Tegra20, it need at lease 10 mS for CPU cluster power down.
> It means when CPU go into LP2, even there is an interrupt wake up him
> immediately. The CPU need to wait for power ready. It's 10mS. Only
> Tegra20 had this limitation.

Okay, theoretically we could have something like the following sequence:

  1) user runs "ifconfig eth0 up"
  2) driver programs network interface to bring up link
  3) driver waits for IRQ
  4) CPU goes to idle
  5) MSI is received
  6) CPU is woken up by interrupt controller
  7) CPU needs 10 ms before power is ready

And I'd expect step 8 to be:

  8) interrupt delivered to CPU

No matter how long the CPU needs to wake up. Or maybe I didn't
understand what you were saying.

Thierry

[0]: https://gitorious.org/thierryreding/linux/blobs/tegra/next/drivers/pci=
/host/pci-tegra.c

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRW+sEAAoJEN0jrNd/PrOh98sQAJFRHFxFIF/GJE0BEp7AYQV6
bigSXDzRiQZLHAx+vbnaFUEE0QRXD+o3dLLXzvkJQltaVwHOlJwEbrYtbhd3OMPm
Pr26ti65OGSGM3I8mvd8DmHAkSYC4Q3svm1jeEt9onf2X2at7bGCEhskou2JIY3u
pqWeHz+oWI3ZZpj24znzj1AK12qjPJe/SNNZjIBf0RZEZWn8quCzEeTGnHW76GDL
wB6Ws14PUk5zZBqO0+hbgXlVSOmpSbd/VWviyWGanMRFNv7ahYrKkQ/xvlmtxTAY
Bx8yntDPFKKwr1kcIqREZwV2lN9x22Kwu+rNghKjkuRRwJI2hg0CQXySSzXHqHld
AGXebSYfkY3RCs3xEyIvd9PC20QoG+Nje7TocgF1jcZTnL0/fgT0AEX4nvJh70kb
YJZ2IgPKFmFpFUsKXMrx3lQUHnj3l/bROHZnpzoiIvy1TgounDq7P8DvYffZsaet
8MS1iQKfBQ+0PFoxZ/1LC94pDOZqAAzwHFqQ6h7EXvYjylQp1NpqIv2zdaNfXvNJ
BOnmSi9J30MxRAQMkwrASAOE+aIcL9ssTxI3cub7dzV8Dl3st/ivIz2oAZoJlrzl
D6sEgKRYooQ+ywKXnxngAqUcE0vSbi5a1PggYWvTkIz11ZWCLrFpIHAII3KAjkSj
mNfPWuV+s25CHAiNJpu7
=i72E
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
