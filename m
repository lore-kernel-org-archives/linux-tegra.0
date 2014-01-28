From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH 3/3] Implement the utility gen_sdram_array
Date: Tue, 28 Jan 2014 10:04:12 -0700
Message-ID: <52E7E30C.1040100@wwwdotorg.org>
References: <1390893857-18716-1-git-send-email-vinceh@nvidia.com> <1390893857-18716-3-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390893857-18716-3-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/28/2014 12:24 AM, Vince Hsu wrote:
> This patch implemtns the ubility to generate a header file from
> multiple sdram config files which each has one set of sdram
> parameters inside only.

I have no idea what this patch is meant to do. What kind of header file,
what are the input and output formats *exactly*, is there an example
somewhere?

Reading the code doesn't give me much more of a clue. but I /think/ the
following might do the same thing?

cat all_the_input_files | sed -e 's/SDRAM[\d+]//'

?

If so, then I'm not sure it's worth even putting this feature into
cbootimage at all, and if it is, a shell script might be a better idea.
