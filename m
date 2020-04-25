From: Sasha Levin <sashal-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5.4.33 0/2] Fix for long operation cmds busy detection
Date: Fri, 24 Apr 2020 21:45:56 -0400
Message-ID: <20200425014556.GD13035@sasha-vm>
References: <1587758766-3274-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1587758766-3274-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, bradleybolen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, anrao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 24, 2020 at 01:06:04PM -0700, Sowjanya Komatineni wrote:
>This series is to backport the upstream patches that fixes busy detection
>for long operation mmc commands by implementing Tegra specific timeout
>callback to switch between finite and infinite HW busy detection wait
>modes.
>
>
>Sowjanya Komatineni (2):
>  sdhci: tegra: Implement Tegra specific set_timeout callback
>  sdhci: tegra: Enable MMC_CAP_WAIT_WHILE_BUSY host capability

What regression do these patches fix?

-- 
Thanks,
Sasha
