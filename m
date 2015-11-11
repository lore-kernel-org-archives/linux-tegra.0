From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH 2/2] Add support for communicating with secured
 production devices
Date: Wed, 11 Nov 2015 10:25:01 -0700
Message-ID: <564379ED.4060503@wwwdotorg.org>
References: <1447089586-24826-1-git-send-email-alban.bedel@avionic-design.de>
 <1447089586-24826-3-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447089586-24826-3-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/09/2015 10:19 AM, Alban Bedel wrote:
> Add the support code needed to sign the RCM with RSA-PSS as needed
> to communicate with secured production devices. This mode is enabled
> by passing the --key command line argument. If such a key is set the
> RCM messages will be signed with it.

IIRC, (at least some) Tegra chips support both SBK (which I believe uses 
the CMAC hash) and (RSA) PKC. "--key" is a bit of a generic term. It 
seems best to rename this cmdline option --pkc to make it clear which of 
the two options it represents, and to allow possible future addition of 
--sbk support without backwards compatibility issues or 
inconsistency/confusion in cmdline option naming.

> diff --git a/src/main.c b/src/main.c

> @@ -123,6 +124,10 @@ static void usage(char *progname)

> +	fprintf(stderr, "\t--key=<key.ber>\n");
> +	fprintf(stderr, "\t\tSpecify the key file for secured devices. The key should be\n");
> +	fprintf(stderr, "\t\tin DER format\n");

Is that the same format cbootimage uses for its keys? I want to make 
sure we're not requiring users to convert keys to different formats in 
order to use different tools.

> diff --git a/src/rsa-pss.cpp b/src/rsa-pss.cpp

Please add a copyright header to the new files.
