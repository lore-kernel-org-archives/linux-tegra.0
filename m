From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: tegra: Add Tegra114 DSI support
Date: Tue, 8 Oct 2013 13:07:49 +0200
Message-ID: <20131008110748.GG19633@ulmo.nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
 <1381146528-18069-6-git-send-email-treding@nvidia.com>
 <525325C2.10107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vSsTm1kUtxIHoa7M"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <525325C2.10107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vSsTm1kUtxIHoa7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2013 at 03:21:06PM -0600, Stephen Warren wrote:
> On 10/07/2013 05:48 AM, Thierry Reding wrote:
> > Add device tree nodes for the DSI controllers found on Tegra114 SoCs.
>=20
> Why not squash patches 3, 4, 5 together, since they're all just adding a
> bunch of similar things to the same DT file?

I did that mostly to mirror the the driver updates. And because the
patches actually come from different people and I wanted to preserve
authorship information.

But I can squash them if you still prefer.

Thierry

--vSsTm1kUtxIHoa7M
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSU+eEAAoJEN0jrNd/PrOh2S0P/2G4ocSsjlfppjlLJjNi4qrV
IJzKs1ysME9PKK5wDXktsjbCrIanmzdtGeFUX9kVZ8pgN7M5wDDR0wPsh1EoVAlL
QMqy02yKAHixNQ9EsrLtNXQXImDUv/6yapAuDb2QRz2FBM3DNTNze8qEvv8szun9
2lZJWE1ZdUsY6r2IBBXAR+tMehMwtCJEqHhm3/RmS71CcEWgXHt4Ymw/HKqljVUz
2l5k/5MsdbfWNmhNERuMmyPNowfZrmOd4GX9swyuIDSBdVDKg6epZmOz3ZN+ybEe
UTjxoizSEm+Y4XxMywYoav3c2MtA3lCJc7Qh5TMRpoBwTYtUiyLnAhDLK0w3ZGf+
bc87PJ6S+MIE/Vw4mueiap38rTFC4ieXTe1x/duOFN+k53fGYiMxfzXjfJw0BVuz
QklPQlw4kSyfwqhxljSCsnA/opV+N7TUEO3XaalUW27ohSkIxiFFucX7juB8RBCM
mrejG5XI/zzeaMKHzkxCvsRjlKVE9L1BKeWiGwQGW6Vz8hduO1qtKgeeYeWxNhDl
A1Y5D/I2ijHm+LnfHGsqq4PsWIEksRcKillOejvQclYd3hpE1iHRWro1Iflh6dMS
EgqtCr/WDGKPba017gJH8W0nOAluxoMsiFiTmoLCIEgmrrrEQlhHaCDovWqJGvOc
cLImCKRe/HvAQyyGjal3
=a2Oq
-----END PGP SIGNATURE-----

--vSsTm1kUtxIHoa7M--
