From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] drm/tegra: fix warning PTR_ERR_OR_ZERO can be used
Date: Sun, 26 May 2019 23:27:43 +0100
Message-ID: <7446cd38-71c5-284d-8a9a-b5ac6865bf35@codethink.co.uk>
References: <20190525070353.GA6727@hari-Inspiron-1545>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190525070353.GA6727@hari-Inspiron-1545>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Hariprasad Kelam <hariprasad.kelam@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 25/05/2019 08:03, Hariprasad Kelam wrote:
> fix below warnings reported by coccicheck
> 
> /drivers/gpu/drm/tegra/drm.c:509:1-3: WARNING: PTR_ERR_OR_ZERO can be
> used
> ./drivers/gpu/drm/tegra/gem.c:419:1-3: WARNING: PTR_ERR_OR_ZERO can be
> used

I'd say the coccicheck should say "Improvement:" here, it's not
something wrong, just code that has a better call available.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
