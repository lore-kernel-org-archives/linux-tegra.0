From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 05/12] firmware: tegra: Add BPMP support
Date: Mon, 22 Aug 2016 16:02:11 +0200
Message-ID: <20160822140211.GE17367@ulmo.ba.sec>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-6-thierry.reding@gmail.com>
 <2059006.oN1pE0IkCo@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2059006.oN1pE0IkCo@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2016 at 03:34:15PM +0200, Arnd Bergmann wrote:
> On Friday, August 19, 2016 7:32:26 PM CEST Thierry Reding wrote:
> > +static bool tegra_bpmp_master_acked(struct tegra_bpmp_channel *channel)
> > +{
> > +	void *frame;
> > +
> > +	frame =3D tegra_ivc_read_get_next_frame(channel->ivc);
> > +	if (IS_ERR_OR_NULL(frame)) {
> > +		channel->ib =3D NULL;
> > +		return false;
> > +	}
> > +
> > +	channel->ib =3D frame;
> > +
> > +	return true;
> > +}
>=20
> Something is wrong with your API if you need IS_ERR_OR_NULL(). If you
> can return NULL, use that for all error. Alternatively make sure
> that you never return NULL=20

You're absolutely right, I had missed those on my first pass. I've since
revised all of the error handling based on earlier comments from Jon and
there are IS_ERR_OR_NULL() left.

> > +static int tegra_bpmp_wait_ack(struct tegra_bpmp_channel *channel)
> > +{
> > +	unsigned long timeout =3D channel->bpmp->soc->channels.cpu_tx.timeout;
> > +	ktime_t start, now;
> > +
> > +	start =3D ns_to_ktime(local_clock());
> > +
> > +	do {
> > +		if (tegra_bpmp_master_acked(channel))
> > +			return 0;
> > +
> > +		now =3D ns_to_ktime(local_clock());
> > +	} while (ktime_us_delta(now, start) < timeout);
> > +
> > +	return -ETIMEDOUT;
> > +}
>=20
> local_clock() is not guaranteed to be in nanoseconds, why not use
> ktime_get() instead?

We don't need nanosecond resolution anyway, all timeouts are specified
in microseconds.

> ktime_us_delta() is a bit slow because of the 64-bit division,
> you could multiply timeout by NSEC_PER_USEC instead and do a
> straight comparison.
>=20
>=20
> 	ktime_t end =3D ktime_add_us(ktime_get(), timeout);
> 	do {
> 		...
> 	} while (ktime_before(ktime_get(), end);

Yes, I think that should work better. Thanks.

> > diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
> > new file mode 100644
> > index 000000000000..0aaef5960e29
> > --- /dev/null
> > +++ b/include/soc/tegra/bpmp-abi.h
> > +#ifndef _ABI_BPMP_ABI_H_
> > +#define _ABI_BPMP_ABI_H_
> > +
> > +#ifdef LK
> > +#include <stdint.h>
> > +#endif
> > +
> > +#ifndef __ABI_PACKED
> > +#define __ABI_PACKED __attribute__((packed))
> > +#endif
> > +
> > +#ifdef NO_GCC_EXTENSIONS
> > +#define EMPTY char empty;
> > +#define EMPTY_ARRAY 1
> > +#else
> > +#define EMPTY
> > +#define EMPTY_ARRAY 0
> > +#endif
> > +
> > +#ifndef __UNION_ANON
> > +#define __UNION_ANON
> > +#endif
>=20
> Maybe keep these all out of the kernel?

This was discussed a little in an earlier posting. This header file is
maintained by the BPMP firmware team and using it verbatim means little
to no effort required to update it.

> > +/**
> > + * @ingroup MRQ_Format
> > + * @brief header for an MRQ message
> > + *
> > + * Provides the MRQ number for the MRQ message: #mrq. The remainder of
> > + * the MRQ message is a payload (immediately following the
> > + * mrq_request) whose format depends on mrq.
> > + *
> > + * @todo document the flags
> > + */
>=20
> What's the deal with the odd documentation format?

This is also a side-effect of this coming straight out of the repository
for the BPMP firmware. Presumably this used to generate documentation
for internal (or possibly public) consumption.

> > +struct mrq_request {
> > +	/** @brief MRQ number of the request */
> > +	uint32_t mrq;
> > +	/** @brief flags for the request */
> > +	uint32_t flags;
> > +} __ABI_PACKED;
>=20
> Marking the structure as packed may result in byte-wise access, depending
> on compiler flags. Is that what you intended? The structure is fully
> packed already, so you won't avoid any padding here.

Agreed, the packing seems unnecessary in many places. However this is
defining an ABI that's used across multiple operating systems, so the
packing may still be required on some systems or toolchains to ensure
the exact same format in the transport.

> > +/**
> > + * @addtogroup Debugfs
> > + * @{
> > + *
> > + * The BPMP firmware implements a pseudo-filesystem called
> > + * debugfs. Any driver within the firmware may register with debugfs
> > + * to expose an arbitrary set of "files" in the filesystem. When
> > + * software on the CPU writes to a debugfs file, debugfs passes the
> > + * written data to a callback provided by the driver. When software on
> > + * the CPU reads a debugfs file, debugfs queries the driver for the
> > + * data to return to the CPU. The intention of the debugfs filesystem
> > + * is to provide information useful for debugging the system at
> > + * runtime.
> > + *
> > + * @note The files exposed via debugfs are not part of the
> > + * BPMP firmware's ABI. debugfs files may be added or removed in any
> > + * given version of the firmware. Typically the semantics of a debugfs
> > + * file are consistent from version to version but even that is not
> > + * guaranteed.
> > + *
> > + * @}
> > + */
> > +/** @ingroup Debugfs */
> > +enum mrq_debugfs_commands {
> > +	CMD_DEBUGFS_READ =3D 1,
> > +	CMD_DEBUGFS_WRITE =3D 2,
> > +	CMD_DEBUGFS_DUMPDIR =3D 3,
> > +	CMD_DEBUGFS_MAX
> > +};
> > +
> > +/**
> > + * @ingroup Debugfs
> > + * @brief parameters for CMD_DEBUGFS_READ/WRITE command
> > + */
> > +struct cmd_debugfs_fileop_request {
> > +	/** @brief physical address pointing at filename */
> > +	uint32_t fnameaddr;
> > +	/** @brief length in bytes of filename buffer */
> > +	uint32_t fnamelen;
> > +	/** @brief physical address pointing to data buffer */
> > +	uint32_t dataaddr;
> > +	/** @brief length in bytes of data buffer */
> > +	uint32_t datalen;
> > +} __ABI_PACKED;
> >
>=20
> If the ABI is version specific, maybe add the firmware version name
> to the structure definition?

I don't think the ABI is version specific. Only the set and contents of
the files in the BPMP's debugfs may change per version. The messages
which are exchanged between the CPU and the BPMP remain the same.

> > +struct cmd_clk_set_rate_request {
> > +	int32_t unused;
> > +	int64_t rate;
> > +} __ABI_PACKED;
>=20
> This structure actually has a non-aligned struct member, but you
> can write that as
>=20
> struct cmd_clk_set_rate_request {
> 	int32_t unused;
> 	int64_t rate;
> } __attribute__((packed, aligned(4)));
>=20
> to still use a default four-byte alignment.

I thought the original would yield something like this in memory:

	[unused]
	[rate  ]
	[rate  ]

because packing makes sure to avoid any padding introduced for natural
alignment. Isn't __attribute__((packd, aligned(4))) going to yield the
exact same layout?

If it's not going to yield the same layout, it's probably too late to
change it now because products are going to ship with this ABI as far
as I understand.

Thierry

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXuwXhAAoJEN0jrNd/PrOh3BAQAICLbixo4lNGys4SpiF3G2L7
v1s8DC8iXfLckRNs4howk0XkM+P9uQ9Le1BKEWVqlnPIBO5uaHrbC8TaZ1DZkbhA
9LbEn9Tqb3xW8KOIRh5xqrzBpb8lCK9OKTzyksLfEhHRtdwpIeFGWUei/s0RVKCC
bxUUj8zQhggJbDV1yCWPHHwzJ6ZPdGU3lT2Wf9EXx0jETgHYwEX8X5rearTQ7DfH
xdyX4tmArcyBijRLgxXtzb1WYj+zY4tJf6HJm8PkVs2mc/bOesd3hoJ0DS+Lhyvg
Aq0nGFjzQF7m/hpCjt7JYGDGCKU00JdbJfDUL9GyhGtbSXWI80yTjA9LT9Shx9AM
T3SLRSDeQBHl37FujVUol/0Bc9FbuxWY2XSFgTqVlJw2TJL+O2C8gDw3ZuDk75d8
1IGSVEUZCoyhjjhC3rShze+rg2Zlo3ZLDhJgV5SYsJiwESeAK0nEoSSXmMlZ5pKj
dGZGSM9fV5iv2nBsUT83795fYb3i/0uHcZbVFZCnHhdLbaKJNBWrKGEVypzgr4pD
KANCQU2WavkUI0/v/94nl/Ui53li73lfQxIRa5JEWf/5uCRMDkjuByQlqxjgZq1Z
Ug3a0Vclt7n8MDTJp8H8m97idrS9vhUxEldgrFM8B1vs+J0+GhTuTParBPSIWx+x
Sqw5ZvCIFLvGtgyfdNkK
=PLCz
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--
