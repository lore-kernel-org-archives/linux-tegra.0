From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [PATCH] gpu: drm: tegra: Adding new typedef vm_fault_t
Date: Wed, 18 Apr 2018 16:39:22 +0530
Message-ID: <CAFqt6zb74=222mOnpnzLpfXEpttHTgpMitB-TgwrLdHKP3dEkg@mail.gmail.com>
References: <20180417134755.GA30291@jordon-HP-15-Notebook-PC> <20180418082439.GA4646@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180418082439.GA4646@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: airlied@linux.ie, jonathanh@nvidia.com, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
List-Id: linux-tegra@vger.kernel.org

> This new function returns VM_FAULT_NOPAGE only for 0 and -EBUSY, whereas
> we used to return VM_FAULT_NOPAGE for -EAGAIN, -ERESTARTSYS and -EINTR
> as well.

Previously vm_insert_page unable to return VM_FAULT_ type due to which
different drivers
have their own mapping from err to VM_FAULT_ type. With new
vmf_insert_page() introduce
in 4.17-rc1 we have a common mapping for err to VM_FAULT_ which remain
same for every
drivers/file systems.

Was this previously wrong?

I think Matthew is the right person to answer this.
