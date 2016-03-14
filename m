From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH V2 2/4] Add option --gen-signed-msgs and
 --signed-msgs-file to generate signed blobs
Date: Mon, 14 Mar 2016 12:58:45 -0600
Message-ID: <56E709E5.30704@wwwdotorg.org>
References: <1457744552-30966-1-git-send-email-jimmzhang@nvidia.com>
 <1457744552-30966-3-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457744552-30966-3-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/11/2016 06:02 PM, Jimmy Zhang wrote:
> This feature allows generation of signed blobs that can later be used
> to communicate with a PKC-enabled Tegra device without access to the
> PKC. Option --bootloader, --soc and --pkc are also required when generating
> the blob.
>
> Example:
> tegrarcm --gen-signed-msgs --signed-msgs-file rel_1001.bin \
>          --bootloader u-boot.bin --loadaddr 0x83d88000 --soc 124 \
>          --pkc rsa_priv.der
>
> Where generated signed message files are:
>
> a) rel_1001.bin.qry
> b) rel_1001.bin.ml
> c) rel_1001.bin.bl

> diff --git a/src/main.c b/src/main.c

> +#define FILENAME_MAX_SIZE 256

Why not use the standard PATH_MAX define?

> +static bool is_supported_soc(uint32_t soc, uint16_t *devid)
> +{
> +	struct _soc_to_devid {

You can simply write "struct {" there.

> +		uint32_t soc;
> +		uint16_t usb_devid;
> +	} soc_to_devid[] = {
> +		{114,	USB_DEVID_NVIDIA_TEGRA114},
> +		{124,	USB_DEVID_NVIDIA_TEGRA124},
> +	};

More SoCs are supported than that; the function name seems a bit 
generic. Perhaps is_soc_supported_for_signed_msgs()?

>   static int initialize_rcm(uint16_t devid, usb_device_t *usb,
> -			const char *pkc_keyfile)
> +			const char *pkc_keyfile, const char *signed_msgs_file)

> +	char query_version_rcm_filename[FILENAME_MAX_SIZE];

You can probably move that inside the "if (signed_msgs_file)" block to 
reduce the scope. But ignore this comment if it would complicate the 
next patch since the variable is used in more code there (I haven't 
looked at that patch yet).

> @@ -466,7 +634,7 @@ static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile
>   	uint32_t miniloader_size;
>   	uint32_t miniloader_entry;
>
> -	// use prebuilt miniloader if not loading from a file
> +	// if using miniloader from an exteranl file

Nit: external
