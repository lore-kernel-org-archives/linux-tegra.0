From: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Subject: Re: [PATCH v2 0/5] 180 degrees rotation support for NVIDIA Tegra DRM
Date: Wed, 17 Jun 2020 10:34:41 +0100
Message-ID: <CAPj87rPwwHWtYpuZfiTMyELvr3D+UAY8CVnH3v6+Lo1-UMRRVA@mail.gmail.com>
References: <20200614200121.14147-1-digetx@gmail.com> <CACvgo51QuXMgWhFk4C=3rGvUZDX1_W0RZtVb5RtRPiHTpMebWQ@mail.gmail.com>
 <8f789ef5-bebf-c869-784d-afda70fc1fb8@gmail.com> <CACvgo50oSMbgXw1vHwVT4hhGe6g3YzKQEohCLJdfDq+0UaN1jw@mail.gmail.com>
 <646b3f37-0f72-7f3b-388f-f71dbcdd5c84@gmail.com> <CACvgo50BFH5qsPyWx9a1aZ4k5bzjSN-3KTU0BvnZ-nG-hfzKOQ@mail.gmail.com>
 <fe845434-cbf6-29d4-eeb6-8868d628fd04@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fe845434-cbf6-29d4-eeb6-8868d628fd04-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, 16 Jun 2020 at 22:16, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The panel's orientation could be parsed by any panel driver and then
> assigned as the connector's property in order to allow userspace/FB-core
> to decide what to do with the rotated display. Apparently upstream
> kernel supports only that one Samsung device which has display panel
> mounted upside-down and it already uses the custom DT properties for
> achieving the 180 rotation. So I don't quite see any panel drivers that
> instantly could benefit from using the rotation property. Perhaps I can
> add the orientation support to the panel-simple driver, but will it be
> useful to anyone?

Yes, exposing it to userspace is helpful, since Weston at least will
parse the property and then apply the correct transform:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/315

Cheers,
Daniel
