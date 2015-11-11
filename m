From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 1/3] Fix the error reporting of
 get_bct_size_from_image()
Date: Wed, 11 Nov 2015 09:31:28 -0700
Message-ID: <56436D60.80505@wwwdotorg.org>
References: <1446739402-14238-1-git-send-email-alban.bedel@avionic-design.de>
 <1446739402-14238-2-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446739402-14238-2-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/05/2015 09:03 AM, Alban Bedel wrote:
> get_bct_size_from_image() should return negative error codes, so add
> the missing minus signs. Also fix the return value check on
> get_bct_size_from_image(), a negative value indicate an error not zero.

> diff --git a/src/data_layout.c b/src/data_layout.c

> @@ -1050,11 +1050,11 @@ int get_bct_size_from_image(build_image_context *context)
>
>   	fp = fopen(context->input_image_filename, "r");
>   	if (!fp)
> -		return ENODATA;
> +		return -ENODATA;

I see the exact same bug in read_bct_file() in the same source file. 
Since that's the same logical bug, any chance you could fix that too in 
the same patch?
