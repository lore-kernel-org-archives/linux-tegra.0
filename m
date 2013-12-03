From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Add MIPI pad calibration DT bindings
Date: Tue, 3 Dec 2013 10:52:43 +0100
Message-ID: <20131203095242.GC21178@ulmo.nvidia.com>
References: <1385990934-20809-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385990934-20809-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 02, 2013 at 02:28:54PM +0100, Thierry Reding wrote:
[...]
> +	host1x@50000000 {
> +		...
> +
> +		dsi@54300000 {
> +			...
> +
> +			nvidia,mipi-calibrate = <&mipi 0x060>;

I just occurred to me that perhaps having a list of pad indices here
would be easier to write and parse than a bitmask. So alternatively this
could be:

			nvidia,mipi-calibrate = <&mipi 5>, <&mipi 6>;

Thierry

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnanqAAoJEN0jrNd/PrOhIbgP/AhphM0uqyjv0tyChre7Q4Wt
opbURjzkp9q+VrFsMoEXqNT3hhRMkuVUoa3qHyCfXRXJv3SLb1rPt7N0WZSU7PaH
U/VnCLcWP73VgVFT6uxjxfZjT8lTj8ERHFYRZmKAtLA8q4cZbJwAGEzFx4dglniZ
zOqu/8LWxi7SpFGqBSDetcTFZ01/a+CSam+RRU3+JNYcsdkAxX774uiX0IOziVQh
4Nh68BTJE+s3GaSvscUuMPQODeh1ZyAOmWqwvjH22eF7kVEQ3d1gp0YCA+tw9e5u
9/jS19ZxZw1y4cdPq33TWaaeJJiflK7LFxqfohm4V0ufemkrKJaKIoMdB3VhSx9s
89D/1gltMQX8vYninRBLO1njrvFxbPA/TZatOZGFPwsfQyWJDH/5wpL0IIx+tFrL
LMJUqOesKONZugkckzgBoduiuYrA7uMKQxvjrhqh2F+3XC7jr4AgvftF1aPcRSiP
qWx6KUrr1ryFWVWshT+nSlrFh4vlCIOpf88rEhbS3t60T+MeOgWhAZLVabGCpvRs
AE8H2x2Uty4DZtMRlG8yvdFsschqPvmHCDB1TD515nWF2uEAawUm73oz4azEp3zE
LZsQJepGFjEuGg6yM1cyifcU1jfC8S52shw5mMDaJWjYRMEJCw6ALQwBx60/OyMS
yz4VF45CfTuRceKIzh8y
=/yak
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
