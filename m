From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH 3/5] mm/mremap: use pmd_addr_end to calculate next in
 move_page_tables()
Date: Thu, 30 Jan 2020 11:28:12 +1100
Message-ID: <20200130112812.68e938e6@canb.auug.org.au>
References: <20200117232254.2792-1-richardw.yang@linux.intel.com>
        <20200117232254.2792-4-richardw.yang@linux.intel.com>
        <7147774a-14e9-4ff3-1548-4565f0d214d5@gmail.com>
        <20200126185951.c9246349befcccce210a4ab8@linux-foundation.org>
        <b5eb4766-38ba-0153-2844-cc303fe0dc07@gmail.com>
        <20200129155907.75868e8a36c5fffc3ec354b9@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EI5dG3bZDZkFOYbEr0C/aGP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200129155907.75868e8a36c5fffc3ec354b9-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wei Yang <richardw.yang-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, aneesh.kumar-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org, yang.shi-KPsoFbNs7GizrGE5bRqYAgC/G2K4zDHf@public.gmane.org, thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--Sig_/EI5dG3bZDZkFOYbEr0C/aGP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 29 Jan 2020 15:59:07 -0800 Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org=
> wrote:
>
> hm, me too.  Stephen, it's unexpected that 9ff4452912d63f ("mm/mremap:
> use pmd_addr_end to calculate next in move_page_tables()") is still in
> the -next lineup?  It was dropped from -mm on Jan 26?

The mmotm 2020-01-28-20-05 arrived just to late for yesterday's
linux-next (it will be in today's linux-next).  The mmotm before that
was 2020-01-23-21-12.  I attempt to fetch mmotm (along with all the
remaining unmerged trees) about every 30 minutes (sometimes more often)
during the day.

--=20
Cheers,
Stephen Rothwell

--Sig_/EI5dG3bZDZkFOYbEr0C/aGP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4yIxwACgkQAVBC80lX
0GzDOAf/fiHwH2H1LxPeGl4/FqwYomv7u+okT+m0GPTVqLAiVNAxj5TLh4k0af7I
M6kISX8+QqZ6XSgPNj9D/xZHXTOI7pmnz6IzUnCexRMC7F94VpTncYIwf+WnTeKs
M5maby2/zgL+WJaJLQ0Pf7BkQtCWpAx4wH2IEjWSC0sBbQjSs5YzTXstuEgxrSLB
rx6aquyCi/aXVfauszE/7bV/q++5oCj262wk0aL7EtQIeW9MRa0DiOE0g5avjIvG
YeifUfZK8q52OVr1/PqBaj1LkfLw6D6pQ2JtzARxdqxc27E2i8WDROeBP+h0hnD1
3QP05IaRjqht0vavjwNoxrVO4Eitkw==
=h1dM
-----END PGP SIGNATURE-----

--Sig_/EI5dG3bZDZkFOYbEr0C/aGP--
