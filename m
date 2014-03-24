From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/12] drm/nouveau: support for probing GK20A
Date: Tue, 25 Mar 2014 00:11:46 +0100
Message-ID: <20140324231144.GJ17218@mithrandir>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-13-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0883385911=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1395650554-31925-13-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0883385911==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ibvzjYYg+QDzMCy1"
Content-Disposition: inline


--ibvzjYYg+QDzMCy1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 24, 2014 at 05:42:34PM +0900, Alexandre Courbot wrote:
[...]
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c b/drivers/gpu/drm/nouveau/core/engine/device/nve0.c
[...]
> +		/* TODO will need an implementation for this at some point... */

Do we? If so the commit message in 11/12 is misleading.

Thierry

--ibvzjYYg+QDzMCy1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTMLuwAAoJEN0jrNd/PrOhEUYQAIlqEosdzccDwcUzmlwIhjHQ
JZHA8dEtrvl+8s6nAuqZvaIdTroeR4dTM3a1MEY3bSajXM8/PEHmClMPHL5rF91G
GXJU21MUtyFHc1P4/e+RCpww6crY/W5BYptUJfns3QJ+aCt1MJGKqb4uVYi5VjLS
fewXFMPw4qgHb5ebc24nR/HXBHj+CA8ZcMHgqt4re/VYr4hzWfo11AsuswhrzsDb
vvIA8zFKQfjb1c73ZEWjUoV/cJE3SzCeR00Yf0F/yMUndWBhrT8hToq7w9/V6gxy
WBwYtqxKS2jM1XFxYuiwXefqvlStM/RzJn90X/xE1qHZhhBlpSq9rS3HqNSzzGA4
8gQzD6eu7O7dxbV8dKHhExCfdqAPGzQQp69gALySOqTnzkwvuu6iXs19cykAgfc/
6rqkgF7ZbxhyFIDc5JOkqMmES+QN97p6RAcKNcPwvFIIN8yd6pwChUQ1EoG6ZJEl
Wvhee/dQiGPP4tktbtG1tzh7BHUvwGTNmdUJkHrjxOUNkRKMt/2B7EnIDVqRbhc7
XHUS83Izwaj4BlG2IO8hTvNtIB5mztY0nQKSczjAKDlZCydUrp+ntjTEwR+NBIQ3
UQAdX0zpZWhvXocjn2KF6DHmKKBZ+43ey+ipFcSYhZww0hACPy0sr2MJ2TTbPWvb
1Vzj3rA7Ioe6MEZBvCA/
=KUjz
-----END PGP SIGNATURE-----

--ibvzjYYg+QDzMCy1--

--===============0883385911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0883385911==--
