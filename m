From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] i2c: tegra: match return type of wait_for_completion_timeout
Date: Tue, 3 Mar 2015 16:36:19 +0900
Message-ID: <CAAVeFuLH1senTZiEhepOTVHdveW9yrda6e66CQ8JqGq4rq5FVg@mail.gmail.com>
References: <1425219461-3261-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425219461-3261-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Mar 1, 2015 at 11:17 PM, Nicholas Mc Guire <hofrat@osadl.org> wrote:
> return type of wait_for_completion_timeout is unsigned long not int. As ret
> was only used for wait_for_completion_timeout here it is renamed to time_left
> the type changed to unsigned long and references fixed up.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Looks good!

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
