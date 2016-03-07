From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 1/4] Add option "--pkc"
Date: Mon, 7 Mar 2016 12:55:52 -0700
Message-ID: <56DDDCC8.9090803@wwwdotorg.org>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-2-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457135087-967-2-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
> Add the support code needed to sign the RCM messages with RSA-PSS as
> needed to communicate with secured production devices. This mode is
> enabled by passing a key via the --pkc command line argument. If such
> a key is set the RCM messages will be signed with it as well as the
> bootloader.
>
> Signed-off-by: Alban Bedel <alban.bedel@...>

Part of that s-o-b line has been corrupted.

If Alban wrote this, there should be a "From:" line for Alban at the top 
of the email. Check that "git log" locally shows Alban as the git author 
of the patch, and "git format-patch" will do the right thing automatically.

Your s-o-b line is missing. It needs to be present even for patches you 
didn't author, but are simply passing on.


IIUC, this patch allows the user to interact with a chip with PKC 
enabled, yet without creating a variety of pre-signed binaries/messages. 
How does that relate to other review comments that complained about 
having to create pre-signed binaries/messages?

> diff --git a/src/main.c b/src/main.c

> +	fprintf(stderr, "\t\tSpecify the key file for secured devices. The key should be\n");

s/key/private key/ ?

> @@ -175,6 +182,7 @@ int main(int argc, char **argv)
>   	int do_read = 0;
>   	char *mlfile = NULL;
>   	uint32_t mlentry = 0;
> +	char *pkc = NULL;

s/pkc/pkc_filename/?

> -static int initialize_rcm(uint16_t devid, usb_device_t *usb)
> +static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char *keyfile)

s/keyfile/pkc_filename/? (there could be an SBK file instead/too 
perhaps, and it'd be good to differentiate the two)

A general comment: It'd be good to call this pkc_filename /everywhere/, 
rather than sometimes pkc, sometimes keyfile, sometimes pkc_keyfile, 
etc. (One exception might be rsa-pss.c, since that's generic crypto 
code, not necessarily exclusively used for chip PKC functionality).

> diff --git a/src/rsa-pss.cpp b/src/rsa-pss.cpp

> + * Copyright (c) 2015-1016, Avionic Design GmbH

s/1016/2016/. Same comment in the header file.

> +extern "C" int rsa_pss_sign(const char *key_file, const unsigned char *msg,
> +			int len, unsigned char *sig_buf, unsigned char *modulus_buf)
> +{

Here and in rsa_pss_sign_file(), it would be good to validate that the 
length of the modulus and signature don't exceed the expected size, so 
that this code doesn't write too much data into sig_buf or modulus_buf.
