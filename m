From: Sivaram Nair <sivaramn@nvidia.com>
Subject: Re: [RFC v2 2/8] video: tegra: Add syncpoint wait and interrupts
Date: Tue, 27 Nov 2012 13:02:59 +0200
Message-ID: <20121127110259.GE10090@sivaramn-lnx>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
 <1353935954-13763-3-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1353935954-13763-3-git-send-email-tbergstrom@nvidia.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Terje Bergstrom <tbergstrom@nvidia.com>
Cc: "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 26, 2012 at 02:19:08PM +0100, Terje Bergstrom wrote:
> +void nvhost_intr_stop(struct nvhost_intr *intr)
> +{
> +       unsigned int id;
> +       struct nvhost_intr_syncpt *syncpt;
> +       u32 nb_pts = nvhost_syncpt_nb_pts(&intr_to_dev(intr)->syncpt);
> +
> +       mutex_lock(&intr->mutex);
> +
> +       intr_op().disable_all_syncpt_intrs(intr);
> +
> +       for (id = 0, syncpt = intr->syncpt;
> +            id < nb_pts;
> +            ++id, ++syncpt) {
> +               struct nvhost_waitlist *waiter, *next;
> +               list_for_each_entry_safe(waiter, next,
> +                               &syncpt->wait_head, list) {
> +                       if (atomic_cmpxchg(&waiter->state,
> +                                               WLS_CANCELLED, WLS_HANDLED)
> +                               == WLS_CANCELLED) {
> +                               list_del(&waiter->list);
> +                               kref_put(&waiter->refcount, waiter_release);
> +                       }
> +               }
> +
> +               if (!list_empty(&syncpt->wait_head)) {  /* output diagnostics */
> +                       pr_warn("%s cannot stop syncpt intr id=%d\n",
> +                                       __func__, id);
> +                       return;

mutex_unlock() missing before return.

-Sivaram
