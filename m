From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] USB: EHCI: tegra: set txfill_tuning
Date: Tue, 15 Apr 2014 13:26:39 +0900
Message-ID: <CAAVeFuLE8hd6mHhRpxNv8+U1x1eFq7RP8YvS_H0owc0q0pFo5A@mail.gmail.com>
References: <1397510483-21383-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1397510483-21383-1-git-send-email-swarren@wwwdotorg.org>
Sender: stable-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 15, 2014 at 6:21 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> From: Stephen Warren <swarren@nvidia.com>
>
> To avoid memory fetch underflows with larger USB transfers, Tegra SoCs
> need txfill_tuning's txfifothresh register field set to a non-default
> value. Add a custom reset override in order to set this up.
>
> These values are recommended practice for all Tegra chips. However,
> I've only noticed practical problems when not setting them this way on
> systems using Tegra124. Hence, CC: stable only for recent kernels which
> actually support Tegra124.

Yay, I can finally ssh into my Venice2!

FWIW:

Tested-by: Alexandre Courbot <acourbot@nvidia.com>
