From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 5/5] Add two sample scripts to do rsa
 signing for T210 bootimage
Date: Fri, 9 Oct 2015 12:28:34 -0600
Message-ID: <56180752.40403@wwwdotorg.org>
References: <1444333109-3671-1-git-send-email-jimmzhang@nvidia.com>
 <1444333109-3671-7-git-send-email-jimmzhang@nvidia.com>
 <5616D8CA.2040209@wwwdotorg.org>
 <797766912b984b9d840369e86e7b2637@HQMAIL103.nvidia.com>
 <561721CC.9030307@wwwdotorg.org>
 <4666228153ed418ab535fe9011c1ff67@HQMAIL103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4666228153ed418ab535fe9011c1ff67-wO81nVYWzR7YuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/09/2015 11:11 AM, Jimmy Zhang wrote:
> I am considering to remove sample sign.sh because
> 1. It is kind of hacking.
> 2. Reversing byte order operation can be removed from sample two but not sign.sh
>
> If you agree, I will remove sign.sh and then rename sign-by-update.sh to sign.sh

I must admit I wondered why you went to the trouble of enhancing 
cbootimage to be able to update the signatures and then provided a 
sample script that didn't use cbootimage:-)

Having a single sample script that only uses cbootimage sounds fine to me.
