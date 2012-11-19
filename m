From: Mark Zhang <markz@nvidia.com>
Subject: Re: [PATCH] drm: Add NVIDIA Tegra30 support
Date: Mon, 19 Nov 2012 14:18:51 +0800
Message-ID: <50A9CF4B.2040308@nvidia.com>
References: <1353041889-3114-1-git-send-email-markz@nvidia.com> <50A66A02.6030608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50A66A02.6030608@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "airlied@redhat.com" <airlied@redhat.com>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 11/17/2012 12:29 AM, Stephen Warren wrote:
> On 11/15/2012 09:58 PM, Mark Zhang wrote:
>> This patch is based on Thierry's drm patch for Tegra20:
>> - [PATCH v2 0/6] Device tree updates for host1x support
>> - [PATCH v3 0/2] NVIDIA Tegra DRM driver
>>
>> It adds the support for NVIDIA Tegra30.
> 
> Mark, I tried to apply this for testing locally, but it doesn't apply.
> 
> For some reason, all the whitespace in the context has been replaced
> with spaces. Are your local copies of dc.c and host1x.c indented with
> spaces for some reason, or did the MS Exchange server corrupt your patch
> as you sent it (I've previously only observed inbound corruption...)
> 

I think that is because the whitespace in patch which Thierry sent:
"[PATCH v3 1/2] drm: Add NVIDIA Tegra20 support" are all spaces, not tabs.

P.S: I saved the patch mail into an eml file and use "git am <eml file>"
to integrate it into my local tree.
