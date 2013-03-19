From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: tegra: fuse: add fuctions to read speedo id and
 process id
Date: Tue, 19 Mar 2013 12:05:10 -0600
Message-ID: <5148A8D6.8000002@wwwdotorg.org>
References: <1363660405-10668-1-git-send-email-dahuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363660405-10668-1-git-send-email-dahuang@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Danny Huang <dahuang@nvidia.com>
Cc: linux@arm.linux.org.uk, ldewangan@nvidia.com, pgaikwad@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 03/18/2013 08:33 PM, Danny Huang wrote:
> Add functions to read the speedo and process id of both cpu and soc.
> There might be some drivers need the information as well.

What code wants to use these functions? It'd be best to submit this
patch with that code, so that something actually uses the functions, and
they don't look like dead code.

In the past, functions similar to this used to exist. However, they were
removed and replaced by direct access to the underlying variables. Do we
actually need functions for this, or can code simply read from the
variables instead?
