From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 4/6] ARM: tegra: Add efuse bindings
Date: Wed, 05 Feb 2014 11:42:36 -0700
Message-ID: <52F2861C.4010109@wwwdotorg.org>
References: <1390952176-30402-1-git-send-email-pdeschrijver@nvidia.com> <1390952176-30402-5-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1390952176-30402-5-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/28/2014 04:36 PM, Peter De Schrijver wrote:
> Add efuse bindings for Tegra20, Tegra30, Tegra114 and Tegra124.

> diff --git a/Documentation/devicetree/bindings/fuse/fuse-tegra.txt b/Documentation/devicetree/bindings/fuse/fuse-tegra.txt

> +- clocks: Should contain a pointer to the fuse clock.

I would prefer to use clock-names, and to follow the same text as all
the other Tegra bindings that are clock clients. In other words:

  - clocks: Must contain an entry for each entry in clock-names.
    See ../clocks/clock-bindings.txt for details.
  - clock-names: Must include the following entries:
    - fuse

(this will allow easy future changes to the binding if required)
