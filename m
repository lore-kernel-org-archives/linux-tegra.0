From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH 1/2] Remove the operational mode check
Date: Wed, 11 Nov 2015 10:07:21 -0700
Message-ID: <564375C9.9070405@wwwdotorg.org>
References: <1447089586-24826-1-git-send-email-alban.bedel@avionic-design.de>
 <1447089586-24826-2-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447089586-24826-2-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/09/2015 10:19 AM, Alban Bedel wrote:
> This check isn't really needed, if communication isn't possible it
> will just fails later on. Further it currently prevent communicating
> with secured devices, so just remove it.

> diff --git a/src/main.c b/src/main.c

> @@ -352,13 +352,6 @@ int main(int argc, char **argv)

> -	if (info.op_mode != RCM_OP_MODE_DEVEL &&
> -	    info.op_mode != RCM_OP_MODE_ODM_OPEN &&
> -	    info.op_mode != RCM_OP_MODE_ODM_SECURE &&
> -	    info.op_mode != RCM_OP_MODE_PRE_PRODUCTION)
> -		error(1, ENODEV, "device is not in developer, open, secure, "
> -		      "or pre-production mode, cannot flash");

I would rather maintain the sanity check. The set of OP_MODE values 
should be quite small, so we should be able to simply add another on 
here. Recasting this as a switch might make the code marginally simpler.

Either way, we should update src/rcm.h to add a new RCM_OP_MODE 
constant, and dump_platform_info() so that it can print the name of the 
relevant other mode(s).
