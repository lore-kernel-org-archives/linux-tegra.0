From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Subject: Re: [PATCHv4 3/8] gpu: host1x: Add channel support
Date: Wed, 2 Jan 2013 11:31:56 +0200
Message-ID: <50E3FE8C.8000309@nvidia.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <1356089964-5265-4-git-send-email-tbergstrom@nvidia.com> <50E3E45A.5050003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50E3E45A.5050003@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Zhang <nvmarkzhang@gmail.com>
Cc: "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "airlied@linux.ie" <airlied@linux.ie>, "dev@lynxeye.de" <dev@lynxeye.de>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 02.01.2013 09:40, Mark Zhang wrote:
> On 12/21/2012 07:39 PM, Terje Bergstrom wrote:
>> Add support for host1x client modules, and host1x channels to submit
>> work to the clients. The work is submitted in GEM CMA buffers, so
>> this patch adds support for them.
>>
>> Signed-off-by: Terje Bergstrom <tbergstrom@nvidia.com>
>> ---
> [...]
>> +/*
>> + * Begin a cdma submit
>> + */
>> +int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job *job)
>> +{
>> +	struct host1x *host1x = cdma_to_host1x(cdma);
>> +
>> +	mutex_lock(&cdma->lock);
>> +
>> +	if (job->timeout) {
>> +		/* init state on first submit with timeout value */
>> +		if (!cdma->timeout.initialized) {
>> +			int err;
>> +			err = host1x->cdma_op.timeout_init(cdma,
>> +					job->syncpt_id);
>> +			if (err) {
>> +				mutex_unlock(&cdma->lock);
>> +				return err;
>> +			}
>> +		}
>> +	}
>> +	if (!cdma->running)
>> +		host1x->cdma_op.start(cdma);
>> +
>> +	cdma->slots_free = 0;
>> +	cdma->slots_used = 0;
>> +	cdma->first_get = host1x->cdma_pb_op.putptr(&cdma->push_buffer);
>> +
>> +	trace_host1x_cdma_begin(job->ch->dev->name);
> 
> Seems missing "mutex_unlock(&cdma->lock);" here.

That's intentional. Writing a job to channel is atomic, so lock is taken
from host1x_cdma_begin() until host1x_cdma_end().

Terje
