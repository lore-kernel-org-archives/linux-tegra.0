From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V2 3/3] get_maintainer: prevent keywords from matching
 filenames
Date: Wed, 06 Mar 2013 16:30:52 -0800
Message-ID: <1362616252.2093.37.camel@joe-AO722>
References: <1362616141-13947-1-git-send-email-swarren@wwwdotorg.org>
	 <1362616141-13947-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1362616141-13947-3-git-send-email-swarren@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Marcin Slusarz <marcin.slusarz@gmail.com>, Lucas Stach <dev@lynxeye.de>, Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@canonical.com>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-03-06 at 17:29 -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> This reverts most of eb90d08 "get_maintainer: allow keywords to match
> filenames"; all except the parts that are required to implement the new
> N: entry type.

Just combine patches 1 and 3 into a single patch.
