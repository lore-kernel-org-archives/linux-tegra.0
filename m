From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 4/4] Increate USB timeout value
Date: Fri, 4 Mar 2016 17:46:44 -0800
Message-ID: <20160305014644.GC19189@nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-5-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457135087-967-5-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 04, 2016 at 03:44:47PM -0800, Jimmy Zhang wrote:
> It has been observed that some times USB time out could occure when a long (3ft)
> usb cable is connected to recovery mode usb port
> 

How about making it a command line argument instead, so next time
someone tries a 6ft cable we don't need another patch? :^)

-Allen
