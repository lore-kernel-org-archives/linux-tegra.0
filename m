From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 5/5] Add two sample scripts to do rsa
 signing for T210 bootimage
Date: Thu, 8 Oct 2015 14:57:46 -0600
Message-ID: <5616D8CA.2040209@wwwdotorg.org>
References: <1444333109-3671-1-git-send-email-jimmzhang@nvidia.com>
 <1444333109-3671-7-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444333109-3671-7-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2015 01:38 PM, Jimmy Zhang wrote:
> sign.sh runs openssl and other linux utilities to generate rsa-pss
> signatures for a prebuilt bootimage and inject signatures and rsa
> modulus into bct directly.
>
> Syntax: sign.sh <bootimage> <rsa_key.pem>
>
> sign-by-update.sh is similar to sign.sh. The difference is the
> signatures update are done by cbootimage with configuration
> keywords "RsaKeyModulusFile", "RsaPssSigBlFile", and "RsaPssSigBctFile".
> Comparing to sign.sh, this script is relatively simple to be ported
> to T124/T114.
>
> Syntax: sign-by-update.sh <bootimage> <rsa_key.pem>

> diff --git a/rsa_priv.pem b/rsa_priv.pem

I hope this is some random private key you generated just for the 
purposes of demonstration...

> diff --git a/sign-by-update.sh b/sign-by-update.sh

Let's put these example files in an examples directory or something like 
that.

Should we update the Makefile to install the examples into some doc 
directory?

> new file mode 100755
> index 000000000000..b3f010a41d0e
> --- /dev/null
> +++ b/sign-by-update.sh
> @@ -0,0 +1,59 @@
> +IMAGE_FILE=$1
> +KEY_FILE=$2

There's no #! line here.

I'd suggest adding "set -e" so there is some simple error-checking.

> +echo " Get rid of all temporary files: *.sig, *.tosig, *.tmp *.mod *.rev"

Why a space at the start of the echo'd data? (Or the end in other 
commands) Quotes aren't needed either, at least for this command. 
Similar comments for all the other echo statements.

> +echo " Reverse bl signature to meet tegra soc signature ordering"
> +$OBJCOPY -I binary --reverse-bytes=256 $IMAGE_FILE.bl.sig $IMAGE_FILE.bl.sig.rev

Should cbootimage do this itself; this feels like an issue related to 
packing the data into the BCT which is what cbootimage handles...

> +echo " Create public key modulus from key file $KEY_FILE and save to $KEY_FILE.mod"
> +$OPENSSL rsa -in $KEY_FILE -noout -modulus -out $KEY_FILE.mod
> +# remove prefix and LF

-noout then -out?

> +$DD bs=1 if=$KEY_FILE.mod of=$KEY_FILE.mod.tmp skip=8 count=512

I'd suggest using cut for that in case the prefix changes; `cut -d= f2`.

> diff --git a/sign.sh b/sign.sh

Likely all the comments for sign-by-update.sh apply here too.

I expect these scripts are very similar. Can the script take a cmdline 
argument to request the update type (dd vs. a all to cbootimage -u) so 
that all the common logic isn't duplicated?

> +echo " Copy the signed binary to the target file $TARGET_IMAGE"
> +$MV $IMAGE_FILE.tmp $TARGET_IMAGE
> +

There's a blank line at EOF there.
