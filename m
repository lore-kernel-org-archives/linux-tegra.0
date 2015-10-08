From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH] Add generated files to .gitignore
Date: Thu, 8 Oct 2015 15:48:44 -0600
Message-ID: <5616E4BC.1070007@wwwdotorg.org>
References: <1444340696-3251-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444340696-3251-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2015 03:44 PM, Allen Martin wrote:
> Add generated and temporary files to .gitignore rules to prevent them from
> cluttering up git status or being accidently committed.

Ah good; I'd noticed that...

Shouldn't the following be added, or are you going to add those to the 
man page patch?

	src/bct_dump.1
	src/bct_dump.man
	src/cbootimage.1
	src/cbootimage.man

If they're going there, then I will apply this.
