From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: tegra: TN7: relax some regulators
Date: Thu, 19 Jun 2014 09:59:04 -0600
Message-ID: <53A308C8.2070004@wwwdotorg.org>
References: <1403164154-1362-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403164154-1362-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 06/19/2014 01:49 AM, Alexandre Courbot wrote:
> Remove the regulator-always-on property from some regulators that do not
> need it. On recent kernels fixed regulators which supply is always on
> fail registration.

That sounds like a bug in the regulator core, which should be fixed there.

After all, we can fix *new* DTs to work around that behaviour change,
but old DTs are supposed to work with new kernels. Fixing this in the DT
doesn't help that.
