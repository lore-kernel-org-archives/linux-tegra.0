From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v4 03/10] pwm: Add device tree support
Date: Thu, 15 Mar 2012 10:29:45 +0000
Message-ID: <20120315102944.GB3138@opensource.wolfsonmicro.com>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de>
 <1331740593-10807-4-git-send-email-thierry.reding@avionic-design.de>
 <201203150840.42659.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201203150840.42659.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 15, 2012 at 08:40:42AM +0000, Arnd Bergmann wrote:
> On Wednesday 14 March 2012, Thierry Reding wrote:

> > +static struct pwm_chip *of_node_to_pwmchip(struct device_node *np)
> > +{

> > +	return ERR_PTR(-EPROBE_DEFER);
> > +}

> EPROBE_DEFER doesn't exist yet in my kernel, and I wonder if it's actually
> safe to be used this way, because it can result in arbitrary drivers using
> this to be put on the defered probe list. It certainly sounds like the
> right thing to do in the long run though.

Similar code is going in for regulators in 3.4 along with the core
-EPROBE_DEFER change (though not OF specific) and I sent a similar patch
for GPIOs too, hopefully Grant will ack it in time for it to make it in.

My theory is that since you need to explicitly know that the thing
you're requesting is there in order to request it (eg, have a PWM number
or DT link) the overwhemlingly common case for a failure to request will
be that the provider didn't register yet which is exactly the case where
deferral is desired.  It therefore seems sensible to have the framework
default the drivers to retrying rather than have almost every individual
driver look at the failure, figure out if it was a missing provider, and
then retry.  Drivers that have a good reason to fail can always check
for -EPROBE_DEFER and override it.

The result should be that we can take advantage of probe deferral over
large areas of the kernel without having to go and explicitly modify so
many drivers - if the frameworks like GPIO, clk and regulator can do
this that ought to cover 90% of the cases where probe deferral will be
needed without having to do anything more than have good error handling
paths on probe which is a good idea anyway.

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPYcSOAAoJEBus8iNuMP3dvR0P/39/+7/y0rlscwQN6UYkgSek
CiFpU8o+vDko8g8CgoCzPfwAnizLB3gKOMYJO4g6fHYIV9CbiB4ApnhQufHPZCxU
qf8EcVxTrPDEQUovfh8qygF2Weqw/U008rnrawsFx2jgTp6Zsyk9MV7aXmxWntTK
SeZ2TCQv83F1xmCOhbeTPobIMdZn7PslCFxKFGTU8yZ/VUDSS0Rp/X7XTzcVdHlS
2ELXqWJ2yTnZgRbjx1gl/FlZoPQ7xo2fF/haLF4yZmRwz0R7UvXOC1R59Q/2TP6H
J9bZsE9N19CZUqvZWKN746e0kXbphSznWHPa2p8rQy3wOeum17VO1bWPbpQBOMjS
7vOjGIASC0tdQGZCPvyieffrRRnPQDfI4p6mH1oBVbDLCirVI18QNojJ/EdenrGa
MBfNN3+3xKYgptzxxVNVo28JpX+7TvAGG1RRzwMJw7y5h/+rJt3TFeE3j0cDXDT8
CXejIVm6GZ1RJ5utrPQoPl/DvNC/nRPSM0AzEH/pZElFLoV+uqQ1+qaazSz6hOI9
3w5S7FMM6Sd798G0rA9hc+ZJFj2EgLjQ/jr3adxd3QA9sWQES3rp9IbFnl7Smq0b
L9jmGkhJnomwkXixThumsno6Lb4BPvJAoL4UmtYJlomSt3KHJ/yg5ZFfKtvK4H4M
jlw60OXMaR605WmmMDOG
=yoNm
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
