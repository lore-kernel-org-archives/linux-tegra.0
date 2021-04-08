Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05824C433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 04:26:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9A1F610FC
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 04:26:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhDHE0m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 00:26:42 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:44111 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229469AbhDHE0j (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 8 Apr 2021 00:26:39 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4FG7W803jgzCg;
        Thu,  8 Apr 2021 06:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1617855988; bh=qV2VpTLMpZWXRFCyeedYlxHbghdwLxGxZaqi0GEU1/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gTjlsVCAGkjaPoo/BbQcO77yNHYvuDMrpCkp/O6NBeZgBsq6ah90OKSkNjqJ1hCTH
         ZjnOizDiBu8ajTdySkdp8ZFxXAUBU5BiRLLsLYX4+mfU/A2Y21MPSYIuaUkWRbwkaf
         8HATHDnNusG77VQl20Gtk1A+9qu6MIexg0yHkP5aQdc8bIXAzsMfoAt0Mw+6ZYl5fp
         bIYLgFvuUXjgU7Z7cYBpOnZYz6hW0/eYpFkdFbwygs4GiUj0QxlaBJoiv4TTunDaZO
         niAb5JPbJNnPlu2ktgcwTWXb13RIVbV9d91XBklxSQ9fHdRa+m22ekvM3wUMdH2KOz
         F4KUvk0DviP0w==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 8 Apr 2021 06:25:31 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Mikko Perttunen <cyndis@kapsi.fi>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>, jonathanh@nvidia.com,
        airlied@linux.ie, daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, talho@nvidia.com,
        bhuntsman@nvidia.com
Subject: Re: [PATCH v5 03/21] gpu: host1x: Show number of pending waiters in
 debugfs
Message-ID: <20210408042531.GC19244@qmqm.qmqm.pl>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-4-mperttunen@nvidia.com>
 <YFm/431gaaP6wY1A@orome.fritz.box>
 <1010683e-56c9-4b06-1540-d8c60a632c70@kapsi.fi>
 <20210401211949.GA25223@qmqm.qmqm.pl>
 <7636618d-72f7-ee0f-df23-1f2ec96973b4@gmail.com>
 <20210408041344.GB19244@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210408041344.GB19244@qmqm.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Apr 08, 2021 at 06:13:44AM +0200, Michał Mirosław wrote:
> On Fri, Apr 02, 2021 at 07:02:32PM +0300, Dmitry Osipenko wrote:
> > 02.04.2021 00:19, Michał Mirosław пишет:
> > > On Fri, Mar 26, 2021 at 04:34:13PM +0200, Mikko Perttunen wrote:
> > >> On 3/23/21 12:16 PM, Thierry Reding wrote:
> > >>> On Mon, Jan 11, 2021 at 03:00:01PM +0200, Mikko Perttunen wrote:
> > >>>> Show the number of pending waiters in the debugfs status file.
> > >>>> This is useful for testing to verify that waiters do not leak
> > >>>> or accumulate incorrectly.
> > >>>>
> > >>>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > >>>> ---
> > >>>>   drivers/gpu/host1x/debug.c | 14 +++++++++++---
> > >>>>   1 file changed, 11 insertions(+), 3 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
> > >>>> index 1b4997bda1c7..8a14880c61bb 100644
> > >>>> --- a/drivers/gpu/host1x/debug.c
> > >>>> +++ b/drivers/gpu/host1x/debug.c
> > >>>> @@ -69,6 +69,7 @@ static int show_channel(struct host1x_channel *ch, void *data, bool show_fifo)
> > >>>>   static void show_syncpts(struct host1x *m, struct output *o)
> > >>>>   {
> > >>>> +	struct list_head *pos;
> > >>>>   	unsigned int i;
> > >>>>   	host1x_debug_output(o, "---- syncpts ----\n");
> > >>>> @@ -76,12 +77,19 @@ static void show_syncpts(struct host1x *m, struct output *o)
> > >>>>   	for (i = 0; i < host1x_syncpt_nb_pts(m); i++) {
> > >>>>   		u32 max = host1x_syncpt_read_max(m->syncpt + i);
> > >>>>   		u32 min = host1x_syncpt_load(m->syncpt + i);
> > >>>> +		unsigned int waiters = 0;
> > >>>> -		if (!min && !max)
> > >>>> +		spin_lock(&m->syncpt[i].intr.lock);
> > >>>> +		list_for_each(pos, &m->syncpt[i].intr.wait_head)
> > >>>> +			waiters++;
> > >>>> +		spin_unlock(&m->syncpt[i].intr.lock);
> > >>>
> > >>> Would it make sense to keep a running count so that we don't have to
> > >>> compute it here?
> > >>
> > >> Considering this is just a debug facility, I think I prefer not adding a new
> > >> field just for it.
> > > 
> > > This looks like IRQ-disabled region, so unless only root can trigger
> > > this code, maybe the additional field could save a potential headache?
> > > How many waiters can there be in the worst case?
> > 
> > The host1x's IRQ handler runs in a workqueue, so it should be okay.
> 
> Why, then, this uses a spinlock (and it has 'intr' in its name)?

The critical sections are already O(n) in number of waiters, so this
patch doesn't make things worse as I previously thought. The questions
remain: What is the expected number and upper bound of workers?
Shouldn't this be a mutex instead?

Best Regards
Michał Mirosław
