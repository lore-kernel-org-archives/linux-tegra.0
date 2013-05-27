From: Arto Merilainen <amerilainen@nvidia.com>
Subject: Re: [PATCH 1/6] gpu: host1x: Fixes to host1x firewall
Date: Mon, 27 May 2013 09:22:15 +0300
Message-ID: <51A2FB97.4040505@nvidia.com>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com>
	<1368791388-31441-2-git-send-email-amerilainen@nvidia.com>
	<20130526100240.GA1652@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130526100240.GA1652@mithrandir>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Terje Bergstrom <tbergstrom@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On 05/26/2013 01:02 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Fri, May 17, 2013 at 02:49:43PM +0300, Arto Merilainen wrote:
>> From: Terje Bergstrom <tbergstrom@nvidia.com>
>>
>> This patch adds several fixes to host1x firewall:
>> - Host1x firewall does not survive if it expects a reloc, but user
>>    space didn't pass any relocs. Also it reset the reloc table for
>>    each gather, whereas they should be reset only per submit. Also
>>    class does not need to be reset for each class - once per submit
>>    is enough.
>> - For INCR opcode the check was not working properly at all.
>> - The firewall verified gather buffers before copying them. This
>>    allowed a malicious application to rewrite the buffer content by
>>    timing the rewrite carefully. This patch makes the buffer
>>    validation occur after copying the buffers.
>
> Can these be split into separate patches, please? It's not only always
> good to split logical changes into separate patches but it also makes
> reviewing a lot more pleasant. It's hard to tell from this combined
> patch which changes belong together.

Sure.

>
> I have a few additional comments inline.
>
>> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
>> index f665d67..4f3c004 100644
>> --- a/drivers/gpu/host1x/job.c
>> +++ b/drivers/gpu/host1x/job.c
>> @@ -228,17 +228,15 @@ static unsigned int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
>>   	void *cmdbuf_page_addr = NULL;
>>
>>   	/* pin & patch the relocs for one gather */
>> -	while (i < job->num_relocs) {
>> +	for (i = 0; i < job->num_relocs; ++i) {
>
> Nit: I prefer post-increment where possible. For consistency.

Will do.

>
>> @@ -268,15 +263,15 @@ static unsigned int do_relocs(struct host1x_job *job, struct host1x_bo *cmdbuf)
>>   	return 0;
>>   }
>>
>> -static int check_reloc(struct host1x_reloc *reloc, struct host1x_bo *cmdbuf,
>> -		       unsigned int offset)
>> +static bool check_reloc(struct host1x_reloc *reloc, struct host1x_bo *cmdbuf,
>> +			unsigned int offset)
>>   {
>>   	offset *= sizeof(u32);
>>
>> -	if (reloc->cmdbuf != cmdbuf || reloc->cmdbuf_offset != offset)
>> -		return -EINVAL;
>> +	if (!reloc || reloc->cmdbuf != cmdbuf || reloc->cmdbuf_offset != offset)
>
> Is the additional !reloc check really necessary? Looking at the callers,
> they always pass in fw->relocarray, which in turn is only NULL if no
> buffers are to be relocated.

Yes, the additional check is necessary exactly for that reason. The code 
will fail if the userspace does not deliver a relocation array and still 
pushes data to an address register.

However, the code *should* check that there are relocations left before 
even coming here so I probably just fix this differently.

>
>> +		return true;
>>
>> -	return 0;
>> +	return false;
>>   }
>
> I wonder whether we should be changing the logic here and have the
> check_reloc() function return true if the relocation is good. I find
> that to be more intuitive.
>

I was also thinking that earlier. Will do.

>> @@ -508,6 +502,7 @@ int host1x_job_pin(struct host1x_job *job, struct device *dev)
>>   	int err;
>>   	unsigned int i, j;
>>   	struct host1x *host = dev_get_drvdata(dev->parent);
>> +
>>   	DECLARE_BITMAP(waitchk_mask, host1x_syncpt_nb_pts(host));
>
> This is an unnecessary whitespace change.

Ops. Will fix.

- Arto
