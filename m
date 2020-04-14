From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 17:05:16 +0200
Message-ID: <20200414150516.GL3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
 <6976796c-6972-328e-3e9f-60c1737cf0e2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6817736749206469243=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <6976796c-6972-328e-3e9f-60c1737cf0e2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============6817736749206469243==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ms5iOKSBOB9YS8zC"
Content-Disposition: inline


--Ms5iOKSBOB9YS8zC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2020 at 11:39:08PM +0300, Dmitry Osipenko wrote:
> > ...
> >> +#define TRIM_REG(chan, rank, reg, byte)					\
> >> +	(((EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> >> +	   _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _MASK &	\
> >> +	   next->trim_regs[EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ##		\
> >> +				 rank ## _ ## reg ## _INDEX]) >>	\
> >> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> >> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte ## _SHIFT)	\
> >> +	 +								\
> >> +	 (((EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> >> +	    byte ## _DATA_BRLSHFT_MASK &				\
> >> +	    next->trim_perch_regs[EMC ## chan ##			\
> >> +			      _EMC_DATA_BRLSHFT_ ## rank ## _INDEX]) >>	\
> >> +	   EMC_DATA_BRLSHFT_ ## rank ## _RANK ## rank ## _BYTE ##	\
> >> +	   byte ## _DATA_BRLSHFT_SHIFT) * 64))
> >> +
> >> +#define CALC_TEMP(rank, reg, byte1, byte2, n)				\
> >> +	(((new[n] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##	\
> >> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _SHIFT)=
 & \
> >> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> >> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte1 ## _MASK)	\
> >> +	 |								\
> >> +	 ((new[n + 1] << EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ##\
> >> +	   reg ## _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _SHIFT)=
 & \
> >> +	  EMC_PMACRO_OB_DDLL_LONG_DQ_RANK ## rank ## _ ## reg ##	\
> >> +	  _OB_DDLL_LONG_DQ_RANK ## rank ## _BYTE ## byte2 ## _MASK))
>=20
> What about replacing those barely readable concatenated macros with a
> raw values?
>=20
> Like:
>=20
> TRIM_REG(brlshft_idx, ob_ddll_long_dq_rank_mask, ...)

That's just going to move the complexity from the macros to the
callsites, isn't it?

I suppose I could spend a few cycles trying to make this a little more
readable, but to be frank, the complexity in this driver is already so
high that this doesn't really make much of a difference, in my opinion.

Thierry

--Ms5iOKSBOB9YS8zC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V0SwACgkQ3SOs138+
s6Ef9w//fxlmCh7FtrH73REQqtD+jRwwLCO5WMC+EHjBY4EUR5lv5mZnrA0uIaBc
FNV4X8OExlN0dMsbYdRTp9CJO7Q8IPggLgaGJQOrR55cT+K8EUXhUPuRPyt83PNY
2x5zUNxRJzxmVqH8OUrknejB/2bedly4MvLNz2rDo9orQVzGRCW05kl9sQmLTl+k
ieyYqweSPPRMw/tgomH2tAz5SaQqnXvv6OK/7JD0Ic9eFBjm2R526wNThK5Tmmzm
jpKuyQv6tksZ5QqLouZHvJIBxN54gF55p57v5SY1LFoj+8Aas1GtdbO9ioKvM86L
OveTWkfYxQUHMDITXcpvnCP3UJOWygeuqxb1azRphChylfgtcppQN/od2ms0AJ0t
femDyT/oDOUbNtwau0hUpckUD3Iag0IkBxu5RKa0aOzQwtxqy0uAL1Oi6qbmYJnN
gzy0PfSnDJqUsIuVxt+S1fKZwnMsCFeGvvqe8IH04drmxLbg1z3OqbCJeBV3xNyg
mK1tsOoFIBnr8nf7ZHODgp5etjxFofaSHV5Ox8oFhNutC+hpmLi5/rQ90P5Jxu/L
3qUkOEGo+MzCMXiUEgJmKjWFLdTxlAQxH3Kq8KnjaedTBgU9NVKvJr97aTWMo/NI
hq9dUvpBJcU01rW0hwcuoeEFOO0ntQo4RzH9ugOBZLQ/Wx1/24A=
=ktP9
-----END PGP SIGNATURE-----

--Ms5iOKSBOB9YS8zC--


--===============6817736749206469243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6817736749206469243==--
