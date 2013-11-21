From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2] ARM: tegra: switch FUSE clock on before usage
Date: Thu, 21 Nov 2013 13:30:16 -0700
Message-ID: <528E6D58.6050503@wwwdotorg.org>
References: <1385001613-19098-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385001613-19098-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11/20/2013 07:40 PM, Alexandre Courbot wrote:
> FUSE clock is enabled by most bootloaders, but we cannot expect it to be
> on in all contexts (e.g. kexec).
> 
> Ensure the FUSE clock is enabled before any of its registers is touched.
> Since FUSE is touched very early during system boot (before the clock
> devices are registered), directly manipulate the clock register bit in
> case the clock device cannot be acquired.

This looks reasonable to me. I'll apply it soon after -rc1.
