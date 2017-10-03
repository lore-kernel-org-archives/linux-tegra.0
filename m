From: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] firmware: tegra: add BPMP debugfs support
Date: Tue, 3 Oct 2017 14:21:56 +0300
Message-ID: <d614ffff-880f-aa2e-ee23-17edef78c3c8@nvidia.com>
References: <1507011133-21817-1-git-send-email-talho@nvidia.com>
 <7fecddd5-f676-83b9-5e6e-6b3cd652e947@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7fecddd5-f676-83b9-5e6e-6b3cd652e947-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


Jon, thanks for reviewing

On 03.10.2017 13:55, Jonathan Hunter wrote:
>> +static int create_debugfs_mirror(struct tegra_bpmp *bpmp, void *buf,
>> +				 size_t bufsize, struct dentry *root)
>> +{
>> +	struct seqbuf seqbuf;
>> +	int err;
>> +
>> +	bpmp->debugfs_mirror = debugfs_create_dir("debug", root);
>> +	if (!bpmp->debugfs_mirror)
>> +		return -ENOMEM;
> 
> Is this extra level needed? Do you plan to have other sub-directories
> under the main bpmp directory?

Yes, the downstream driver has few files under main directory (e.g. 
'ping' to check that firmware is alive, or 'tag' to read the firmware 
version).

BR,
Timo
