From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 3/7] soc/tegra: default select TEGRA_TIMER for Tegra210
Date: Thu, 31 Jan 2019 12:26:55 +0100
Message-ID: <20190131112655.GC23438@ulmo>
References: <20190131092410.28222-1-josephl@nvidia.com>
 <20190131092410.28222-4-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3969646089766168489=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190131092410.28222-4-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============3969646089766168489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LwW0XdcUbUexiWVK"
Content-Disposition: inline


--LwW0XdcUbUexiWVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2019 at 05:24:06PM +0800, Joseph Lo wrote:
> The tegra timer is necessary for Tegra210 to support CPU idle power-down
> state. So select it by default.
>=20
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v4:
>  * new added in this version
> ---
>  drivers/soc/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

So this technically depends on patch 2/7, so it would make sense for
Daniel or Thomas to pick this up along with 2/7, but you didn't Cc them,
so they're not aware of this.

I think you need to either resend the series and Cc both Daniel and
Thomas on all the patches in the series, or we have to make sure that
this patch is not applied before patch 2/7, otherwise Kconfig will
complain. If you decide to resend, this patch is:

Acked-by: Thierry Reding <treding@nvidia.com>

Thierry

--LwW0XdcUbUexiWVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxS234ACgkQ3SOs138+
s6Ha+g/+KksMkDLC2hmHrQkoFq3UeuPezAUmE3S5RGAUgg6/YsHdIfe2nyEWa9R9
CipRPytWvf8LarYPfrGVDLw2/xjPwaG5ksMPmYmbp7JTtFnIMjal4wD+E5gBMYai
vFqrzwKPyNBEpbuS00N+buJdPy8NbMr6uPmyQNBtYlpkFMEhXv5Nv5eHgECkX2i9
UY+sNcXRDSf7SaDK4y3ot3T8+K6hGfTPAhw9d0SwTmrxpUYfamOo8Y7qUJC83nac
705WMAG++oulqEUXuajZmvCuCMQXQ0NANjL/74j6i7hWb1RFCrS1OkgfgO0V1XD0
AzFYaHhPT0eFB2EkP3XBDhYZ9YtKEU88iNXjlnV+zt/Dup/CkojOM0C/28Z7JE+g
YYYTmEHXTCdY9ilPiyF4hgxI9EHpxj1PtwZLJSh/BxPGoIf7c7+w4uzmMIXzkcqz
nCgVsn8VTpEIW/dN749+BVWma40CtNPglJF7AnzV7zAuMfgnue4wknndd2+n7U8a
KFFUw4EbU4YM7msVtfz57i95X64h/HpVi+dkIR97znr+X+z78tE62c1TFBqRxEzL
x+Hxc/Zf0XgSxS90sx8nboxgnhVn/KVRgLhMXNv+Zi8PJ2QkfbXM207UafE+WC+e
dciyOw3hf2U7qHiqXQJ/VUYzFMpwzeZv3CaShkHPM6g6dbUJf4M=
=Y6zP
-----END PGP SIGNATURE-----

--LwW0XdcUbUexiWVK--


--===============3969646089766168489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3969646089766168489==--
