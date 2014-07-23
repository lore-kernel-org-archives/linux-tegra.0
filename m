From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] drm/tegra: add MODULE_DEVICE_TABLEs
Date: Wed, 23 Jul 2014 13:29:32 -0600
Message-ID: <53D00D1C.9030305@wwwdotorg.org>
References: <1403130115-23583-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1403130115-23583-1-git-send-email-swarren@wwwdotorg.org>
Sender: stable-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 06/18/2014 04:21 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> When tegra-drm.ko is built as a module, these MODULE_DEVICE_TABLEs allow
> the module to be auto-loaded since the module will match the devices
> instantiated from device tree.
> 
> (Notes for stable: in 3.14+, just git rm any conflicting file, since they
> are added in later kernels. For 3.13 and below, manual merging will be
> needed)
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> v2: Remove change to drm.c, since the match table there isn't used for
> probing.

Thierry, I think this patch got lost? It doesn't appear in next-20140721
anyway.
