From: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH v4 0/5] memory: Introduce memory controller mini-framework
Date: Fri, 14 Feb 2020 08:46:46 +0100
Message-ID: <20200214074646.j57uywq27xqrnjrd@gilmour.lan>
References: <20200213163959.819733-1-thierry.reding@gmail.com>
 <9841eb35-65e4-632a-ceff-bb2ba3b11bb0@arm.com>
 <20200213181555.GB1006063@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cgx7eqxuhae5r2xz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200213181555.GB1006063@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cgx7eqxuhae5r2xz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 07:15:55PM +0100, Thierry Reding wrote:
> On Thu, Feb 13, 2020 at 05:23:23PM +0000, Robin Murphy wrote:
> > [+ Maxime]
> >
> > On 13/02/2020 4:39 pm, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >
> > > Hi,
> > >
> > > this set of patches adds a new binding that allows device tree nodes to
> > > explicitly define the DMA parent for a given device. This supplements
> > > the existing interconnect bindings and is useful to disambiguate in the
> > > case where a device has multiple paths to system memory. Beyond that it
> > > can also be useful when there aren't any actual interconnect paths that
> > > can be controlled, so in simple cases this can serve as a simpler
> > > variant of interconnect paths.
> >
> > Isn't that still squarely the intent of the "dma-mem" binding, though? i.e.
> > it's not meant to be a 'real' interconnect provider, but a very simple way
> > to encode DMA parentage piggybacked onto a more general binding (with the
> > *option* of being a full-blown interconnect if it wants to, but certainly no
> > expectation).
>
> The way that this works on Tegra is that we want to describe multiple
> interconnect paths. A typical device will have a read and a write memory
> client, which can be separately "tuned". Both of these paths will target
> system memory, so they would both technically be "dma-mem" paths. But
> that would make it impossible to treat them separately elsewhere.
>
> So we could choose any of them to be the "dma-mem" path, but then we
> need to be very careful about defining which one that is, so that
> drivers know how to look them up, which is also not really desirable.
>
> One other things we could do is to duplicate one of the entries, so that
> we'd have "read", "write" and "dma-mem" interconnect paths, with
> "dma-mem" referencing the same path as "read" or "write". That doesn't
> sound *too* bad, but it's still a bit of a hack. Having an explicit
> description for this sounds much clearer and less error prone to me.

IIRC the dmaengine binding allows to do that, so it would make sense
to me to have the same thing allowed for interconnects.

Maxime

--cgx7eqxuhae5r2xz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXkZQZgAKCRDj7w1vZxhR
xZN1AP9xEZt3x9xN7nNg9v862AKEohAW68yHN8slrEdDkuDjLAEArPnr7wS/Ocya
nXTLIBU8NqQbSLnqTc5obXprpB/YcgM=
=twP1
-----END PGP SIGNATURE-----

--cgx7eqxuhae5r2xz--
