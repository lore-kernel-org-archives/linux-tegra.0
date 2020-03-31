From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/3] soc/tegra: fuse: Add custom SoC attributes
Date: Tue, 31 Mar 2020 17:46:04 +0300
Message-ID: <17fb371a-14f7-360a-48c3-7f079875a8a4@gmail.com>
References: <20200331103341.19571-1-jonathanh@nvidia.com>
 <4f1fabbb-a0a3-6f7d-f62c-2bd545f2644a@gmail.com>
 <bd1b2056-dc72-323b-bda5-d99df3a139a6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bd1b2056-dc72-323b-bda5-d99df3a139a6-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

31.03.2020 16:56, Jon Hunter пишет:
...
>>> +static DEVICE_ATTR(minorrev, S_IRUGO, tegra_soc_minorrev_show,  NULL);
>>
>> Checkpatch should give a warning about that permission isn't in octal
>> format, please don't ignore it.
> 
> Indeed. Will fix. I thought I had ran this previously, obviously not.

Also, please use DEVICE_ATTR_RO().
